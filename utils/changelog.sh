#!/bin/bash

TODAY=$(date "+%Y.%m.%d")
RESULT_FILE="CHANGELOG.md"
LATEST_GIT_TAG=$(git tag | head -n 1)
GIT_LOG=$(git log "$LATEST_GIT_TAG..HEAD" --pretty=format:"%B")
HOSTNAME=$(hostname)

home() {
    echo "## [v$TODAY]"
    echo ""
    echo "$GIT_LOG" |
        # Remove blank line
        sed -e '/^$/d' |
        # Make list
        sed -e 's/^/- /g'
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
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty --no-verify'
    echo "$GIT_LOG" |
        # Remove blank line
        sed -e '/^$/d' |
        # Remove STARTUPTIME.md commit msg
        sed -e 's/.*STARTUPTIME.md.*//g' |
        # Remove DROP commit msg
        sed -e 's/.*DROP.*//g' |
        # Remove blank line
        sed -e '/^$/d' |
        sed -e 's/^/git commit -m "WIP:/g' |
        sed -e 's/$/" --allow-empty --no-verify/g'
    echo 'git commit -m "WIP:--------------------------------------------------------------------------" --allow-empty --no-verify'
    echo '```'
}

if [[ "$HOSTNAME" = "TanakaPC" ]]; then
    work >>$RESULT_FILE
else
    home >>$RESULT_FILE
fi
