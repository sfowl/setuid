%global namever %{name}-%{version}

Name:           setuid
Version:        0.0.1
Release:        2
Summary:        setuid binary to root

License:        AGPLv3
URL:            https://git.prodsec.redhat.com/sfowler/recompile
Source0:        %{name}-%{version}.tar.gz
BuildArch:      x86_64


%description
setuid binary to root


%prep
%setup

%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT

install -d %{buildroot}/%{_bindir}

install -m 4755 %{name} %{buildroot}/%{_bindir}/%{name}


%files
%{_bindir}/%{name}



%changelog
* Tue May 26 2020 Sam Fowler
- rebuilt
