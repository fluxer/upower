#!/bin/sh
# Run this to generate all the initial makefiles, etc.

set -e

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

(test -f $srcdir/src/Makefile.am) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level upower directory"
    exit 1
}

which autoreconf > /dev/null || {
    echo "You need to autotools installed"
    exit 1
}

which intltoolize > /dev/null || {
    echo "You need to intltoolize installed"
    exit 1
}

mkdir -p m4
autoreconf -fi
intltoolize -f -c
./configure $@
