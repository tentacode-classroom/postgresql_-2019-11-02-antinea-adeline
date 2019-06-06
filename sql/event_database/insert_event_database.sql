/* ----------------- INSERT SOME DATA -----------------*/
\c github_events

-- Push Event
INSERT INTO push_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    branch,
    commits
) VALUES (
    'PushEvent', 
    '{
        "id":42629292,
        "login":"georgewillben",
        "avatar_url":"https://avatars.githubusercontent.com/u/42629292?"
    }',
    '{
        "id":155680648,
        "name":"georgewillben/dsc-1-05-05-selecting-data-online-ds-pt-100118",
        "url":"https://api.github.com/repos/georgewillben/dsc-1-05-05-selecting-data-online-ds-pt-100118"
    }',
    TRUE,
    '2018-11-02T02:00:00Z'::timestamp,
    'refs/heads/wip',
    ARRAY[
        '{
            "author":{"name":"George Bennett","email":"1202a32376df40fa4ced0c828082e37955d57801@gmail.com"},
            "message":"automatically backed up by learn",
            "url":"https://api.github.com/repos/georgewillben/dsc-1-05-05-selecting-data-online-ds-pt-100118/commits/df2caa4dc9c05f94342dd323012317ba64c4464f"
        }'
    ]::json[]
);

-- Create events
INSERT INTO create_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    branch_name,
    create_type,
    description_event
) VALUES (
    'CreateEvent', 
    '{
        "id":7122237,
        "login":"Maslow",
        "avatar_url":"https://avatars.githubusercontent.com/u/7122237?"
    }',
    '{
        "id":155680648,
        "name":"georgewillben/dsc-1-05-05-selecting-data-online-ds-pt-100118",
        "url":"https://api.github.com/repos/georgewillben/dsc-1-05-05-selecting-data-online-ds-pt-100118"
    }',
    TRUE,
    '2018-11-02T02:00:00Z'::timestamp,
    'master',
    'branch',
    'Source of maslow.github.io repo'
);

-- Issue comment events
/*INSERT INTO issue_comment_events (
    type_event, 
    actor,
    repo,
    public,
    created_at,
    issue_info,
    issue_url,
    info
) VALUES (
    'IssueCommentEvent', 
    '{
        "id":12377640,
        "login":"irina060981",
        "display_login":"irina060981",
        "avatar_url":"https://avatars.githubusercontent.com/u/12377640?"
    }',
    '{
        "id":129736263,
        "name":"alpheios-project/documentation",
        "url":"https://api.github.com/repos/alpheios-project/documentation"
    }',
    TRUE,
    '2018-11-02T02:00:00Z'::timestamp,
    ROW(
        ROW(
            '@balmas, @irina060981: Please review a proposition of an application architecture for our business classes: 
            https://github.com/alpheios-project/documentation/blob/master/development/component-architecture.md.\r\nI 
            think it would be beneficial to us to standardize behavior of such components as UIController, ContentProcess, 
            BackgroundProcess, etc.\r\n\r\nDecided to assemble this piece and offer if for discussion before doing changes to the controller objects required to avoid preliminary data loading in Safari tabs, when content script is loaded to every tab automatically.\r\n\r\n
            Please let me know your opinions. It would be great if we combine our experiences and ideas on this! Thanks!',
            '2018-10-17T13:16:14Z'::timestamp,
            '2018-11-02T02:00:00Z'::timestamp
        ),
        '{
            "login":"kirlat",
            "id":18631055,
            "avatar_url":"https://avatars1.githubusercontent.com/u/18631055?v=4",
        }',
        'Component (Object) Architecture',
        'https://api.github.com/repos/alpheios-project/documentation',
        'open',
        FALSE,
        NULL,
        NULL,
        15,
        ARRAY[
            '{
                "login":"kirlat",
                "id":18631055,
                "avatar_url":"https://avatars1.githubusercontent.com/u/18631055?v=4"
            }',
            '{
                "login":"irina060981",
                "id":12377640,
                "avatar_url":"https://avatars1.githubusercontent.com/u/12377640?v=4"
            }'
        ]::json[]
    ),
    'https://api.github.com/repos/alpheios-project/documentation/issues/3', --issu url
    ROW(
            'I think there could be 2 approaches (according to the discussion):\r\n\r\n1) consider UIController as a unique controller for handling with getting different data, working with saved states and passing data to various view elements - and in this variant we should use LexicalQuery with UIController. And UIController should be very configurable and be easy to use with others.\r\n\r\n2)UIController and LexicalQuery are independent - they could be used one without another or could be used together. And there are some very generic methods to communicate - for example using events.\r\n\r\nThe main problem with generic events is that events handling is not a standard mechanism for all used platforms - chrome and safari has some difference between using events and node version should have node-way events. It seems to me that creation of such overall bus events could be not an easy solution.\r\n\r\nAlso let''s imagine in what cases we should use LexicalQuery separated from UIController - for LexicalQuery we need different options (language, vocabular preferences for definitions), need some localization for passing messages and we need to have define the output rules for different parts of recieved data. So to use all it we should duplicate the UIController sence in some separated place and it won''t be an easy task for anyone.\r\n\r\nFor example, let''s imagine we need to use LexicalQuery for getting data for Inflection-games, I have as an input some word (may be with additional defining data) and want to get from LQ inflection-tables and lemmas with part of speech and definitions. I should pass: \r\n\r\n   -  targetWord (or HTMLSelection?  from alpheios-components and then I could not use it somehow without direct selection in some browser)\r\n   - options - LanguageID (as a constant from alpheios-components), vocabulars (in a form as it saved in alpheios-components)\r\n  - what exactly I want to retrieve (lemmas, shortdefs and inflection tables with full matches)\r\n  - localization language (as it used in the alpheios-components) or may be the whole localization library\r\n  \r\n  And I should get out some data - may be it should be independent from alpheios-components or alpheios-inflection-tables - so I would be able to handle with it having only documented properties and methods.\r\n\r\nIt seems to me that I will need to recreate a big part of UIController and also I will need to know a lot of details how to create it.\r\n\r\nIn this way I would prefer to use some ready UIController solution but configurable and independent from any view components with well documented input and output. This way it could have an easier integration to different tasks (browser, embedded, node version). \r\n',
            '2018-11-02T02:00:00Z'::timestamp,
            '2018-11-02T02:00:00Z'::timestamp
    )
);*/