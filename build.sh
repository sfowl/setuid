#! /usr/bin/env bash

# This is ugly, there must be a better way

set -e
set -x
set -u


SPECFILE=setuid.spec
RPMDIR=$(rpm --eval "%{_rpmdir}")
SRPMDIR=$(rpm --eval "%{_srcrpmdir}")
SRCDIR=$(rpm --eval "%{_sourcedir}")
# NV=$(rpmspec -q --qf "%{name}-%{version}" $SPECFILE)
NV=setuid-0.0.1-2
rpmdev-setuptree || ( echo '"rpmdevtools" required' && exit 1 )

git archive --format=tar.gz --prefix="$NV"/ HEAD:src/ > "$SRCDIR/$NV.tar.gz"

rpmbuild -ba $SPECFILE
cp "$RPMDIR"/*/$NV*.x86_64.rpm .
cp "$SRPMDIR"/$NV*.src.rpm .
