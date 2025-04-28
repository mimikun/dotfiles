#!/bin/bash

if ! test "$(
  sudo uname >>/dev/null
  echo $?
)" -eq 0; then
  return
fi

read_prompt="Shutdown?"

if read_confirm; then
  sync
  sync
  sync
  sudo shutdown -h now
fi
