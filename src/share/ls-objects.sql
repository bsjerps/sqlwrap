-----------------------------------------------------------------------------
-- Title       : ls-objects.sql
-- Description : Lists objects from all_objects type VIEW, TABLE, SYNONYM
-- Author      : Bart Sjerps <bart@dirty-cache.com>
-- License     : GPLv3+
-----------------------------------------------------------------------------
-- All tables 

SET TERM OFF ECHO OFF HEAD OFF FEED OFF TRIMS ON FEEDBACK OFF PAGES 0

spool /tmp/sqlplus.objects

SELECT DISTINCT(object_name) FROM all_objects
WHERE object_type in ('TABLE', 'VIEW', 'SYNONYM')
ORDER BY 1;

spool off


