#!/bin/bash

PRODUCT_NAME="dotfiles"
TODAY=$(date +'%Y%m%d')
BRANCH_NAME=$(git branch --show-current)
GPG_PUB_KEY="CCAA9E0638DF9088BB624BC37C0F8AD3FB3938FC"
USE_GPG=false

if [[ "$BRANCH_NAME" = "master" ]] || [[ "$BRANCH_NAME" = "patch-"* ]]; then
    echo "This branch is master or patch branch"

    for p in "$PRODUCT_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
else
    echo "This branch is uniq feat branch"

    for p in "$PRODUCT_NAME" "_" "$BRANCH_NAME" "." "$TODAY" "." "patch"; do
        PATCH_NAME+=$p
    done
fi

# if GPG patch
if ! $USE_GPG; then
    echo "patch file name: $PATCH_NAME"
    git diff origin/master >"$PATCH_NAME"
else
    GPG_PATCH_NAME+=$PATCH_NAME
    GPG_PATCH_NAME+=".gpg"
    echo "gpg patch file name: $GPG_PATCH_NAME"
    git diff origin/master | gpg --encrypt --recipient "$GPG_PUB_KEY" >"$GPG_PATCH_NAME"
fi
