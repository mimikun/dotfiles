#!/bin/bash

OLD_VERSION="$(pkgx --version | sed -e 's/pkgx //g')"
VERSION="$(curl --silent https://api.github.com/repos/pkgxdev/pkgx/releases/latest | jq .name -r | sed -e 's/^v//g')"

if test "$OLD_VERSION" != "$VERSION"; then
    echo "Update found!"
    curl -Ssf https://pkgx.sh/$(uname)/$(uname -m).tgz | sudo tar xz -C /usr/local/bin
else
    echo "No update required."
fi
