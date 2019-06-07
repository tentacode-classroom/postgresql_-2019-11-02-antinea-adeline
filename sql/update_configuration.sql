-- change default port value to 1234
ALTER SYSTEM SET port=5432;

-- change work memory
ALTER SYSTEM SET work_mem = '100MB';

ALTER SYSTEM SET listen_addresses='*';

-- Display port and work_mem values
SELECT name, setting FROM pg_settings WHERE name IN ('port','work_mem','listen_addresses');

-- --Reset system
-- ALTER SYSTEM RESET all;




