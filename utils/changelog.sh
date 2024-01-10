#!/bin/bash

TODAY=$(date "+%Y.%m.%d")
REMOTE_NAME="origin"
BRANCH_NAME="master"
RESULT_FILE="CHANGELOG.md"

{
    echo "## run"
    echo ""
    git log "$REMOTE_NAME/$BRANCH_NAME"..HEAD --pretty=format:"%B" | sed -e '/^$/d' | sed -e 's/^/- /g'
    echo ""
    echo '```bash'
    echo 'git commit -m "WIP:'
    echo '" --allow-empty'
    git log "$REMOTE_NAME/$BRANCH_NAME"..HEAD --pretty=format:"%B" | sed -e '/^$/d'
    echo '```'
    echo ""
    echo "## [v$TODAY]"
    echo ""
    echo "### Added - 新機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Changed - 既存機能の変更について"
    echo ""
    echo "なし"
    echo ""
    echo "### Removed - 今回で削除された機能について"
    echo ""
    echo "なし"
    echo ""
    echo "### Fixed - 不具合修正について"
    echo ""
    echo "なし"
    echo ""
} >>$RESULT_FILE
