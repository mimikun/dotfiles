#!/bin/bash

TEMPSTR=$(docker-compose version --short)
OLD_VERSION="v$TEMPSTR"
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r)
DESTINATIONS=("$HOME/.docker/cli-plugins/docker-compose" "/usr/local/lib/docker/cli-plugins/docker-compose")

if test "$OLD_VERSION" != "$VERSION"; then
  echo "Update found!"
  curl -L "https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o "${DESTINATIONS[0]}"
  sudo cp "${DESTINATIONS[0]}" "${DESTINATIONS[1]}"
  # $HOME/.docker/cli-plugins/docker-compose
  chmod 755 "${DESTINATIONS[0]}"
  # /usr/local/lib/docker/cli-plugins/docker-compose
  sudo chmod 755 "${DESTINATIONS[1]}"
else
  echo "No update required."
fi
