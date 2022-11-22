#!/bin/bash

ip address show eth0 | awk '/inet / {print $2}' | awk -F / '{print $1}'
