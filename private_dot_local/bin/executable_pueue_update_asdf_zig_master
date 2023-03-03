#!/bin/bash

ZIG_VERSION=$(zig version)
ZIG_NEW_VERSION=$(curl -sSL https://ziglang.org/download/index.json | jq .master.version --raw-output)

if [ "$ZIG_VERSION" != "$ZIG_NEW_VERSION" ]; then
  echo "zig (latest)master found!"
  asdf uninstall zig master
  pueue add -- 'asdf install zig master'
else
  echo "zig (latest)master is already installed"
  echo "version: $ZIG_VERSION"
fi
