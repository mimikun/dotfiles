#!/usr/bin/env bash
# Lint every tracked shell script with shellcheck.
#
# chezmoi templates are skipped: Go template syntax is not valid shell.
# fish scripts are skipped: shellcheck cannot parse fish.

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd -- "$repo_root"

files=()
while IFS= read -r file; do
    case "$file" in
    *.tmpl | *.fish) continue ;;
    *.sh)
        files+=("$file")
        continue
        ;;
    esac

    # Extensionless scripts (mise tasks, ~/.local/bin helpers) carry no hint in
    # their name, so identify them by shebang instead.
    IFS= read -r shebang <"$file" 2>/dev/null || continue
    if [[ $shebang =~ ^#!.*[[:space:]/](sh|bash|dash|ksh)([[:space:]]|$) ]]; then
        files+=("$file")
    fi
done < <(git ls-files)

if ((${#files[@]} == 0)); then
    echo "shellcheck: no shell scripts found" >&2
    exit 1
fi

# --severity=warning mirrors the -Severity Warning used by scripts/pssa.ps1.
shellcheck --severity=warning "${files[@]}"

echo "shellcheck: no issues found in ${#files[@]} files."
