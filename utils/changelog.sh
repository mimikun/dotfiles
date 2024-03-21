#!/bin/bash

TODAY=$(date "+%Y.%m.%d")
RESULT_FILE="CHANGELOG.md"
LATEST_GIT_TAG=$(git tag | head -n 1)
GIT_LOG=$(git log "$LATEST_GIT_TAG..HEAD" --pretty=format:"%B")
HOSTNAME=$(hostname)

home() {
    echo "## [v$TODAY]"
    echo ""
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/- /g'
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
}

work() {
    echo "## run"
    echo ""
    echo '```bash'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo "$GIT_LOG" | sed -e '/^$/d' | sed -e 's/^/git commit -m "WIP:/g' | sed -e 's/$/" --allow-empty/g'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty'
    echo '```'
}

if [[ "$HOSTNAME" = "TanakaPC" ]]; then
    work >>$RESULT_FILE
else
    home >>$RESULT_FILE
fi
