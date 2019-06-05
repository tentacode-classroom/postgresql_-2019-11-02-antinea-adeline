DROP DATABASE IF EXISTS github_events;
CREATE DATABASE github_events;


CREATE TABLE "events" (
    id serial PRIMARY KEY NOT NULL,
    type_event varchar(50),
    actor json NOT NULL,
    payload json NOT NULL
);


CREATE TABLE "watch_events" (
  action  varchar(255) NOT NULL
) INHERITS ("events");


CREATE TABLE "push_events" (
  branch  varchar(255) NOT NULL
) INHERITS ("events");