#!/bin/bash

OLD_VERSION=$(chromedriver --version | cut -d ' ' -f 2)
VERSION=$(curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
DESTINATION="/usr/local/bin/chromedriver"

if test "$OLD_VERSION" != "$VERSION"; then
  echo "Update found!"
  curl -L "https://chromedriver.storage.googleapis.com/${VERSION}/chromedriver_linux64.zip" -o /tmp/chromedriver_linux64.zip
  sleep 5
  CURRENTDIR=$(pwd)
  cd /tmp && unzip chromedriver_linux64.zip
  sleep 5
  cd "${CURRENTDIR}" || exit
  sudo cp /tmp/chromedriver ${DESTINATION}
  sudo rm -f /tmp/chromedriver*
  sudo chmod 755 ${DESTINATION}
else
  echo "No update required."
fi
