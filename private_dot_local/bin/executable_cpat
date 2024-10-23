#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.1.0"
PRODUCT_NAME="$(basename "${0}")"

#=======================
# 関数定義
#=======================

# 使い方、ヘルプメッセージ
usage() {
  cat <<EOF
$PRODUCT_NAME v$PRODUCT_VERSION
Copy the PAT to the clipboard command. (for mimikun)

Usage:
    $PRODUCT_NAME

Options:
    --github -gh, github           Copy GitHub PAT
    --codeberg --cb, codeberg      Copy Codeberg PAT
    --gitea --gt, gitea            Copy gitea PAT
    --version, -v, version         Print $PRODUCT_NAME version
    --help, -h, help               Print this help
EOF
}

# バージョン情報出力
version() {
  echo "$PRODUCT_NAME v$PRODUCT_VERSION"
}

# Copy GitHub PAT
cp_github() {
    echo "$GITHUB_PAT" | wl-copy
}

# Copy Codeberg PAT
cp_codeberg() {
    echo "$CODEBERG_PAT" | wl-copy
}

# Copy gitea PAT
cp_gitea() {
    echo "$GITEA_PAT" | wl-copy
}

#=======================
# メイン処理
#=======================

while (("$#")); do
  case "$1" in
  -h | --help | help)
    usage
    exit 1
    ;;
  -v | --version | version)
    version
    exit 1
    ;;
  -gh | --github | github)
    cp_github
    exit 1
    ;;
  -cb | --codeberg | codeberg)
    cp_codeberg
    exit 1
    ;;
  -gt | --gitea | gitea)
    cp_gitea
    exit 1
    ;;
  *)
    break
    ;;
  esac
done

# vim:ft=bash
