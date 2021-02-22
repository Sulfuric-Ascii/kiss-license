#!/bin/sh -ef
# Display a package's license

# Use the current directory as the package name if no package is given.
[ "$1" ] || {
    export KISS_PATH=${PWD%/*}:$KISS_PATH
    set -- "${PWD##*/}"
}

kiss list "$pkg" > /dev/null || {
    printf 'usage: kiss-license [pkg]\n' >&2
    exit 1
}

cd "$(kiss search "$@" | uniq -f 1)"
if [ ! -e "license" ]; then
        printf 'license file missing.\n'
        exit 1
fi
grep "" license
