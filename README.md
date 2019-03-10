# sqlwrap

SQLWrap provides TAB completion for SQL*Plus filenames and commands using
[rlwrap](https://github.com/hanslub42/rlwrap).

# Description

_sqlwrap_ executes rlwrap sqlplus with parameters to enable command history and
command completion for .sql scripts and sql commands.
sqlwrap uses an rlwrap filter ’sqlplus_filter’ which reads 
all sql scripts in the current working directory and 
```$SQLPATH``` (and subdirs), prepends them with ’@’ and adds them as 
possible completions when using sqlplus. It also loads all
readable wordlists matching:

_/usr/share/rlwrap/completions/sqlplus.*_

# Download

It is recommended to install via YUM (See [Installation](# Installation)).


# Features

* Autocompletes SQL scripts starting with '@' on the SQL*Plus command
  line for all ```.sql``` scripts in $SQLPATH, its subdirectories
  and the current working directory.
* Autocompletes all words from $RLWAP_HOME/completions/sqlplus.* after
  typing the first 2 characters
* Blacklists words in the wordlists if they start with '-'

# Requirements

* Oracle SQL*PLus (sqlplus executable) in $ORACLE_HOME/bin
* rlwrap installed

# Installation

## from YUM repository (recommended)

```
yum install http://yum.outrun.nl/outrun-extras.rpm
yum install sqlwrap
```

## From source

Download or clone from GIT, cd to the src directory. Then

```
make install
```
Or, if you don't have root access:

```
make user
```
(this will install sqlwrap in $HOME/bin and $HOME/sqlwrap)

# Manual
See [MAN PAGE](doc/sqlwrap.md)

# Example

See below for an example of sqlwrap in action.

![example1](https://bsjerps.github.io/images/sqlwrap-demo.gif)


# Future
- Better wordlists?

# Licensing

_sqlwrap_ is licensed under GPLv3. See "COPYING" for more info.

# Support

Please file bugs and issues at the Github issues page. 
