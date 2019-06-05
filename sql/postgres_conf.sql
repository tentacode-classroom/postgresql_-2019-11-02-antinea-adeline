
ALTER SYSTEM SET port=1234;

SELECT name, setting FROM pg_settings WHERE name='port';

