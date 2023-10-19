Name:		sqlwrap
Summary:	filename and command completion for SQL*Plus using rlwrap
Version:	0.1.8.4
Release:	1%{?dtap}
BuildArch:	noarch
URL:		https://github.com/outrunnl/sqlwrap
Source0:	%{name}-%{version}.tbz2
License:	GPLv3+
Group:		Outrun/Extras
Requires:	rlwrap >= 0.42

%description
Provides TAB completion for SQL*Plus filenames and commands using rlwrap

%prep
%setup -q -n %{name}

%install
rm -rf %{buildroot}
install -m 0755 -d %{buildroot}/etc
install -m 0755 -d %{buildroot}/usr/bin
install -m 0755 -d %{buildroot}/usr/share/%{name}
install -m 0755 -d %{buildroot}/usr/share/rlwrap
install -m 0755 -d %{buildroot}/usr/share/doc/%{name}
install -m 0755 -d %{buildroot}/usr/share/man/man1

cp -p  bin/*    %{buildroot}/usr/bin
cp -p  doc/*    %{buildroot}/usr/share/doc/%{name}
cp -pr etc/*    %{buildroot}/etc
cp -p  share/*  %{buildroot}/usr/share/%{name}
cp -p  man1/*   %{buildroot}/usr/share/man/man1
cp -pr rlwrap/* %{buildroot}/usr/share/rlwrap/

%files
/usr/share/doc/%{name}
/usr/share/%{name}
%defattr(0644,root,root)
/etc/profile.d/sqlwrap.sh
%defattr(0444,root,root)
%verify(not mode) /usr/share/rlwrap/completions/*
/usr/share/man/man1/sqlwrap.1.gz
%defattr(0755,root,root)
/usr/bin/sqlwrap*
/usr/share/rlwrap/filters/sqlplus_filter
