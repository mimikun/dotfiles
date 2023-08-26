#!/bin/bash

remote_url=$(
    git remote -v |
        head -n 1 |
        cut -d ' ' -f 1 |
        sed -e 's/origin//g' |
        sed -e 's/\t//g' |
        sed -e 's/ssh:\/\/git@/http:\/\//g' |
        sed -e 's/\:2200/\:8080/g'
)
echo "$remote_url"
