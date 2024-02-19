#!/bin/bash

cargo_outdated_pkgs=$(cargo install-update -l | grep "Yes" | cut -d " " -f 1)
echo "Update these packages:"
echo "$cargo_outdated_pkgs"
for i in $cargo_outdated_pkgs; do
  cargo install "$i"
done
