#!/bin/bash

if test "$(
  test -z "$read_prompt"
  echo $?
)" -eq 0; then
  read_prompt="Continue?"
fi

while :; do
  read -r -p "${read_prompt} [y/N]: " confirm

  case "${confirm}" in
  Y | y)
    exit 0
    ;;
  '' | N | n)
    exit 1
    ;;
  esac
done
