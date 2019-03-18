<HTML><HEAD>
</HEAD><BODY>
<H1>SQLWRAP</H1>
Section: Oracle Utilities (1)<BR>Updated: February 2019<BR><A HREF="#index">Index</A>
<A HREF="http://localhosthttps://linux.die.net/man/1/man2html">Return to Main Contents</A><HR>

<A NAME="lbAB">&nbsp;</A>
<H2>NAME</H2>

sqlwrap - command and filename completion for Oracle SQL*Plus
<A NAME="lbAC">&nbsp;</A>
<H2>SYNOPSIS</H2>

<B>sqlwrap</B>
<I>&lt;parameters&gt;</I>

<A NAME="lbAD">&nbsp;</A>
<H2>DESCRIPTION</H2>

<B>sqlwrap</B>
executes 'rlwrap sqlplus' with parameters to enable command history
and command completion for .sql scripts and sql commands.
<P>

sqlwrap uses an rlwrap filter 'sqlplus_filter' which reads all sql scripts
in the current working directory and $SQLPATH (and subdirs), prepends them with '@' 
and adds them as possible completions
when using sqlplus. It also loads all readable wordlists named
/usr/share/rlwrap/completions/sqlplus.*
<A NAME="lbAE">&nbsp;</A>
<H2>USAGE</H2>

Set the $SQLPATH environment variable to where you want sqlwrap to 
search for sql scripts. Like with $PATH it can be colon separated
i.e. 
<BR>

export SQLPATH=/usr/local/sql:/usr/share/sql:$HOME/sql

Note that, unlike the Linux shell,
<B>sqlwrap</B>
will also search each path's subdirectories. If you want to have sqlwrap also
search the current working directory's subdirs, add '.' to SQLPATH.

Run sqlwrap like you would sqlplus, or use an alias 
(this is already done via the bash profile if installed via RPM or 'make'):

alias sqlplus='sqlwrap '

Make sure sqlplus starts with a message like this:

Loading sqlwrap plugin with 6224 completion words

In sqlplus, type '@' after the command prompt and press TAB twice to see all SQL script completions,
or type the first 2 characters of a keyword followed by two TABs.

All the usual rlwrap features also work, such as command history with up/down keys etc.
<P>

SQL scripts must have '.sql' as extension.
<A NAME="lbAF">&nbsp;</A>
<H2>OPTIONS</H2>

All parameters are passed on to 'sqlplus'.
<A NAME="lbAG">&nbsp;</A>
<H2>WORDLISTS</H2>

<B>sqlwrap</B>
reads wordlists from /usr/share/rlwrap/completions/sqlplus.* if the files are readable.
Files that are not readable are skipped.

The reason for having sqlwrap (actually, sqlplus_filter) read the wordlists is that if rlwrap would
read the wordlists itself (with -f option or as completions/sqlplus file) it would pass over 6000 words
from rlwrap to the filter executable each time you press TAB, which becomes terribly slow.

By loading the wordlists only at startup and returning completions only if the word to be completed is
2 characters or more, responsiveness dramatically increases.

If you want to add additional words you can do so by adding wordlists 
as /usr/share/rlwrap/completions/sqlplus.&lt;customname&gt;,
or per-user as $HOME/.sqlplus_completions.

You can also blacklist words by prepending them with '-'. Blacklisted words have priority over regular
words, so any blacklisted word cannot be added again via another file.

If you want to (temporarily) disable pre-configured wordlists, just make them non-readable i.e.
<BR>

chmod 000 /usr/share/rlwrap/completions/sqlplus.list
<A NAME="lbAH">&nbsp;</A>
<H2>ENVIRONMENT</H2>

$SQLPATH - contains a colon-separated list of directories where *.sql scripts are
to be found.
<BR>

$ORACLE_HOME - must be set and $PATH must contain sqlplus.
<BR>

$RLWRAP_HOME - if set, contains the (alternative) directory for wordlists (i.e. $HOME/completions)
<BR>

$RLWRAP_FILTERDIR - if set, rlwrap will look for the sqlplus_filter perl script there
(use if you cannot install sqlwrap as root i.e. $HOME/filters)

See <A HREF="http://localhosthttps://linux.die.net/man/1/man2html?1+rlwrap">rlwrap</A>(1) for more info on $RLWRAP_HOME and $RLWRAP_FILTERDIR.
<A NAME="lbAI">&nbsp;</A>
<H2>FILES</H2>

/usr/bin/sqlwrap
- Wrapper for rlwrap to call it with the correct parameters
<BR>

/usr/share/rlwrap/filters/sqlplus_filter
- completion script for <A HREF="http://localhosthttps://linux.die.net/man/1/man2html?1+rlwrap">rlwrap</A>(1)
<BR>

/usr/share/rlwrap/completions/sqlplus.*
Word lists for SQL*Plus
<BR>

/usr/share/sqlwrap/
- SQL Scripts to create the word lists from Oracle
<BR>

/etc/profile.d/sqlwrap.sh
- Sets the alias sqlplus='sqlwrap '
<A NAME="lbAJ">&nbsp;</A>
<H2>BUGS AND ISSUES</H2>

- rlwrap gets real slow when preloading large lists of words (-f &lt;file&gt;, $HOME/.sqlplus_completions) and passing it to
filters. This is not an
<B>sqlwrap</B>
bug but rather the way rlwrapfilter is implemented. Only use this for a few words, otherwise create an sqlplus.* file.

<A NAME="lbAK">&nbsp;</A>
<H2>COPYRIGHT</H2>

Copyright &#169; 2018 Bart Sjerps &lt;<A HREF="mailto:bart@outrun.nl">bart@outrun.nl</A>&gt;
<P>

License GPLv3+: GNU GPL version 3 or later &lt;<A HREF="http://gnu.org/licenses/gpl.html">http://gnu.org/licenses/gpl.html</A>&gt;.
<P>

This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
<P>

If you have suggestions for improvements in this tool, please send them along via the above address.
<A NAME="lbAL">&nbsp;</A>
<H2>SEE ALSO</H2>

<A HREF="http://localhosthttps://linux.die.net/man/1/man2html?1+rlwrap">rlwrap</A>(1), <A HREF="http://localhost/cgi-bin/man/man2html?3pm+RlwrapFilter">RlwrapFilter</A>(3pm)
<P>

<HR>
<A NAME="index">&nbsp;</A><H2>Index</H2>
<DL>
<DT><A HREF="#lbAB">NAME</A><DD>
<DT><A HREF="#lbAC">SYNOPSIS</A><DD>
<DT><A HREF="#lbAD">DESCRIPTION</A><DD>
<DT><A HREF="#lbAE">USAGE</A><DD>
<DT><A HREF="#lbAF">OPTIONS</A><DD>
<DT><A HREF="#lbAG">WORDLISTS</A><DD>
<DT><A HREF="#lbAH">ENVIRONMENT</A><DD>
<DT><A HREF="#lbAI">FILES</A><DD>
<DT><A HREF="#lbAJ">BUGS AND ISSUES</A><DD>
<DT><A HREF="#lbAK">COPYRIGHT</A><DD>
<DT><A HREF="#lbAL">SEE ALSO</A><DD>
</DL>
<HR>
This document was created by
<A HREF="http://localhosthttps://linux.die.net/man/1/man2html">man2html</A>,
using the manual pages.<BR>
Time: 11:43:51 GMT, March 18, 2019
</BODY>
</HTML>
