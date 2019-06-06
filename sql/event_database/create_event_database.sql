/* ----------------- CREATE -----------------*/
DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;

\c github_events

-- TYPE
CREATE TYPE "informations" AS(
  body text,
  create_date timestamp,
  update_date timestamp
);

CREATE TYPE "issue_informations" AS(
  info informations,
  user_owner json,
  title text,
  repo_url text,
  issue_state text,
  locked boolean,
  milestone_date timestamp,
  close_date timestamp,
  comments_nb int,
  assignees json[]  
);


-- TABLE
CREATE TABLE "events" (
    id serial PRIMARY KEY NOT NULL,
    type_event varchar(50),
    actor json NOT NULL,
    repo json NOT NULL,
    public boolean NOT NULL,
    created_at timestamp NOT NULL
);

CREATE TABLE "create_events" (
  branch_name text,
  create_type text NOT NULL,
  description_event text
) INHERITS ("events");


CREATE TABLE "push_events" (
  branch  varchar(255) NOT NULL,
  commits json[] NOT NULL
) INHERITS ("events");

CREATE TABLE "issue_comment_events" (
  issue_info  issue_informations NOT NULL,
  issue_url  text NOT NULL,
  info informations NOT NULL
) INHERITS ("events");

