#============================================================================
# Title       : sqlwrap.sh
# Description : Enable rlwrap aliases for oracle SQL*Plus if rlwrap is found
# Author      : Bart Sjerps <bart@outrun.nl>
# License     : GPLv3+ 
# ---------------------------------------------------------------------------

if [ -x /usr/bin/rlwrap ]; then
  alias sqlplus='sqlwrap '
fi
