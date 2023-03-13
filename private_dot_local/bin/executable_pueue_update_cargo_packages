#!/bin/bash

cargo_outdated_pkgs=$(cargo install-update -l | grep "Yes" | cut -d " " -f 1)
for i in $cargo_outdated_pkgs; do
  pueue add -- "cargo install $i"
done
