DROP VIEW issues_most_commented;
DROP VIEW number_repo_created_per_date;
DROP VIEW repo_have_most_commit;



CREATE VIEW repo_have_most_commit AS 
     SELECT repo ->> 'name' as "Nom du Repository", 
     COUNT(commits) AS commit_count 
     FROM push_events 
     GROUP BY repo ->> 'name'
     ORDER BY commit_count DESC;

CREATE VIEW issues_most_commented AS 
    SELECT (issue_info).title, 
    (issue_info).comments_nb, 
    (issue_info).issue_state
    FROM issue_comment_events
    ORDER BY (issue_info).comments_nb DESC;


CREATE VIEW number_repo_created_per_date AS 
    SELECT created_at as "Created  On",
    COUNT(*) as "Number of Repository"
    FROM create_events
    WHERE create_type = 'repository'
    GROUP BY created_at
    ORDER BY created_at DESC;

SELECT * FROM issues_most_commented;
SELECT * FROM number_repo_created_per_date;
SELECT * FROM repo_have_most_commit;