\c github_events

INSERT INTO push_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    branch,
    commits
) SELECT
    json_data->>'type',
    json_data->'actor',
    json_data->'repo',
    (json_data->'public')::boolean,
    (json_data->>'created_at')::text::timestamp,
    json_data->'payload'->>'ref',
    (SELECT array_agg(e::json) FROM jsonb_array_elements(json_data->'payload'->'commits') e)

FROM raw_events
WHERE json_data->>'type' = 'PushEvent';

INSERT INTO create_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    branch_name,
    create_type,
    description_event
) SELECT
    json_data->>'type',
    json_data->'actor',
    json_data->'repo',
    (json_data->'public')::boolean,
    (json_data->>'created_at')::text::timestamp,
    json_data->'payload'->>'ref',
    json_data->'payload'->>'ref_type',
    json_data->'payload'->>'description'

FROM raw_events
WHERE json_data->>'type' = 'CreateEvent';

INSERT INTO issue_comment_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    issue_info,
    issue_url,
    comment_info
) SELECT
    json_data->>'type',
    json_data->'actor',
    json_data->'repo',
    (json_data->'public')::boolean,
    (json_data->>'created_at')::text::timestamp,
    (SELECT (
        (SELECT (
            json_data#>'{payload,issue}'->>'body',
            (json_data#>'{payload,issue}'->>'created_at')::text::timestamp,
            (json_data#>'{payload,issue}'->>'updated_at')::text::timestamp
        )::informations),
        json_data#>'{payload,issue}'->'user',
        json_data#>'{payload,issue}'->>'title',
        json_data#>'{payload,issue}'->>'repository_url',
        json_data#>'{payload,issue}'->>'state',
        (json_data#>'{payload,issue}'->>'closed_at')::text::timestamp,
        (json_data#>'{payload,issue}'->'comments')::int,
        (SELECT array_agg(e::json) FROM jsonb_array_elements(json_data#>'{payload,issue}'->'assignees') e)
    )::issue_informations),
    json_data#>'{payload,comment}'->>'issue_url',
    (SELECT(
        json_data#>'{payload,comment}'->>'body',
        (json_data#>'{payload,comment}'->>'created_at')::text::timestamp,
        (json_data#>'{payload,comment}'->>'updated_at')::text::timestamp
    )::informations)

FROM raw_events
WHERE json_data->>'type' = 'IssueCommentEvent';

SELECT * FROM issue_comment_events LIMIT 2;