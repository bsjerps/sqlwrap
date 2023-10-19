-----------------------------------------------------------------------------
-- Title       : ls-initparam.sql
-- Description : Shows init parameters
-- Author      : Bart Sjerps <bart@dirty-cache.com>
-- License     : GPLv3+
-----------------------------------------------------------------------------
-- All init parameters except the hidden ones (_%)

SET TERM OFF ECHO OFF HEAD OFF FEED OFF TRIMS ON FEEDBACK OFF PAGES 0

spool /tmp/sqlplus.init

SELECT name FROM v$parameter
WHERE name NOT LIKE '\_%' ESCAPE '\'
ORDER BY 1;

spool off


