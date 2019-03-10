#!/usr/bin/make -f
# Makefile for Outrun RPM packages - called by rpmbuild %make_install
# It installs doc files, man pages and the file/dir structure under ./files

RPM_PACKAGE_NAME = sqlwrap

NAME      := $(RPM_PACKAGE_NAME)

man1dir   := $(DESTDIR)/usr/share/man/man1
docdir    := $(DESTDIR)/usr/share/doc/$(NAME)
sharedir  := $(DESTDIR)/usr/share/
etcdir    := $(DESTDIR)/etc
rlwdir    := $(DESTDIR)/usr/share/rlwrap

.PHONY: all doc man files

default: all

doc:
	install -m 0755 -d $(DESTDIR)/usr/share/doc/$(NAME)
	test -f COPYING   && install -m 0644 -pt $(DESTDIR)/usr/share/doc/$(NAME) COPYING   || true
	test -f CHANGELOG && install -m 0644 -pt $(DESTDIR)/usr/share/doc/$(NAME) CHANGELOG || true
	test -f README    && install -m 0644 -pt $(DESTDIR)/usr/share/doc/$(NAME) README    || true

man:
	install -m 0755 -d $(man1dir)
	install -m 0644 -pt $(man1dir) man1/*

	find $(DESTDIR)/usr/share/man -type f ! -name "*.gz" | xargs -I% gzip %

files:
	install -m 0755 -d $(DESTDIR)/usr/share/$(NAME) $(DESTDIR)/usr/bin
	install -m 0755 -d $(DESTDIR)/usr/share/rlwrap/{filters,completions}
	install -m 0755 -d $(DESTDIR)/etc/profile.d

	install -m 0755 -pt $(DESTDIR)/usr/bin bin/sqlwrap
	install -m 0644 -pt $(DESTDIR)/etc/profile.d etc/profile.d/sqlwrap.sh
	install -m 0644 -pt $(DESTDIR)/usr/share/$(NAME) share/*
	install -m 0644 -pt $(DESTDIR)/usr/share/rlwrap/filters filters/sqlplus_filter
	install -m 0644 -pt $(DESTDIR)/usr/share/rlwrap/completions completions/*

all:


install: man doc files

user:
	install -m 0755 -d $$HOME/bin $$HOME/sqlwrap/{filters,completions}
	install -m 0755 -pt $$HOME/bin bin/sqlwrap
	install -m 0755 -pt $$HOME/sqlwrap/filters filters/sqlplus_filter /usr/share/rlwrap/filters/RlwrapFilter.pm
	install -m 0755 -pt $$HOME/sqlwrap/completions completions/*

uninstall:
	rm -f $(DESTDIR)/usr/bin/sqlwrap
	rm -f $(DESTDIR)/etc/profile.d/sqlwrap.sh
	rm -rf $(DESTDIR)/usr/share/$(NAME)
	rm -f $(DESTDIR)/usr/share/rlwrap/filters/sqlplus_filter
	rm -f $(DESTDIR)/usr/share/rlwrap/completions/rman
	rm -f $(DESTDIR)/usr/share/rlwrap/completions/sqlplus.*

