-----------------------------------------------------------------------------
-- Title       : ls-functions.sql
-- Description : Lists packages, procedures and functions from all_objects
-- Author      : Bart Sjerps <bart@outrun.nl>
-- License     : GPLv3+
-----------------------------------------------------------------------------
-- All tables 

SET TERM OFF ECHO OFF HEAD OFF FEED OFF TRIMS ON FEEDBACK OFF PAGES 0

spool /tmp/sqlplus.functions

SELECT DISTINCT(object_name) FROM all_objects
WHERE object_type in ('PACKAGE', 'PROCEDURE', 'FUNCTION')
ORDER BY 1;

spool off


