#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.5.0"
PRODUCT_NAME="$(basename "${0}")"

#=======================
# 関数定義
#=======================

# 使い方、ヘルプメッセージ
usage() {
  cat <<EOF
$PRODUCT_NAME(bash)
Update asdf-neovim

Usage:
    $PRODUCT_NAME <COMMAND> <SUBCOMMANDS>

Commands:
  master                  Run update asdf neovim master
  stable                  Run update asdf neovim stable
  nightly                 Run update asdf neovim nightly

Command options:
  --use-pueue               Run command with pueue

Options:
    --version, -v, version    print $PRODUCT_NAME version
    --help, -h, help          print this help
EOF
}

# バージョン情報出力
version() {
  echo "$PRODUCT_NAME(bash) v$PRODUCT_VERSION"
}

function _master() {
  NEOVIM_MASTER_COMMIT_HASH_FILE=$HOME/.cache/neovim-master-commit-hash.txt
  MASTER_COMMIT_HASH=$(cat "$NEOVIM_MASTER_COMMIT_HASH_FILE")
  MASTER_NEW_COMMIT_HASH=$(git ls-remote --heads --tags https://github.com/neovim/neovim.git | grep refs/heads/master | cut -f 1)

  if [ "$MASTER_COMMIT_HASH" != "$MASTER_NEW_COMMIT_HASH" ]; then
    echo "neovim (latest)master found!"
    echo "$MASTER_NEW_COMMIT_HASH" >"$NEOVIM_MASTER_COMMIT_HASH_FILE"
    asdf uninstall neovim ref:master
    if [ "$opt" == "--use-pueue" ]; then
      pueue add -- "asdf install neovim ref:master"
    else
      asdf install neovim ref:master
    fi
  else
    echo "neovim (latest)master is already installed"
    echo "commit hash: $MASTER_COMMIT_HASH"
  fi
}

function _nightly() {
  NVIM_NIGHTLY_VERSION=$(nvim --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NVIM_NIGHTLY_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$NVIM_NIGHTLY_VERSION" != "$NVIM_NIGHTLY_NEW_VERSION" ]; then
    echo "neovim (latest)nightly found!"
    asdf uninstall neovim nightly
    if [ "$opt" == "--use-pueue" ]; then
      pueue add -- "asdf install neovim nightly"
    else
      asdf install neovim nightly
    fi
  else
    echo "neovim (latest)nightly is already installed"
    echo "version: $NVIM_NIGHTLY_VERSION"
  fi
}

function _stable() {
  NVIM_STABLE_VERSION=$("$ASDF_DIR/installs/neovim/stable/bin/nvim" --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NVIM_STABLE_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$NVIM_STABLE_VERSION" != "$NVIM_STABLE_NEW_VERSION" ]; then
    echo "Update neovim (latest)stable!"
    asdf uninstall neovim stable
    if [ "$opt" == "--use-pueue" ]; then
      pueue add -- "asdf install neovim stable"
    else
      asdf install neovim stable
    fi
  else
    echo "neovim (latest)stable is already installed"
    echo "version: $NVIM_STABLE_VERSION"
  fi
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
  master | stable | nightly)
    cmd=$1
    opt=$2
    shift
    ;;
  *)
    break
    ;;
  esac
done

case $cmd in
master)
  _master "$opt"
  ;;
stable)
  _stable "$opt"
  ;;
nightly)
  _nightly "$opt"
  ;;
*)
  usage
  exit 1
  ;;
esac
