-----------------------------------------------------------------------------
-- Title       : ls-reserved.sql
-- Description : Shows reserved words in SQL*Plus
-- Author      : Bart Sjerps <bart@dirty-cache.com>
-- License     : GPLv3+
-----------------------------------------------------------------------------
-- Shows reserved words with length 3 or more from v$reserved words
-- To keep the wordlist short, exclude XML* and words containing underscores
-- Also we exclude some words to improve ease of use:
-- SELECT is used much more often than SELECTIVITY

SET TERM OFF ECHO OFF HEAD OFF FEED OFF TRIMS ON FEEDBACK OFF PAGES 0

spool /tmp/sqlplus.reserved

SELECT keyword FROM v$reserved_words
WHERE length >= 2
AND regexp_like(keyword, '^[A-Z].*')
AND keyword NOT LIKE '%\_%' ESCAPE '\' 
AND keyword NOT LIKE 'XML%' 
ORDER BY keyword;

spool off

-- alternate, shorter version (110 words):
-- select keyword from v$reserved_words where length > 1
-- and reserved = 'Y' or res_attr = 'Y' or res_semi = 'Y'

