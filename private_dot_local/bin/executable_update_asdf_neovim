#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.4.0"
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
  master                  Run update_asdf_neovim_master
  stable                  Run update_asdf_neovim_stable
  nightly                 Run update_asdf_neovim_nightly
  pueue_master            Run pueue_update_asdf_neovim_master
  pueue_stable            Run pueue_update_asdf_neovim_stable
  pueue_nightly           Run pueue_update_asdf_neovim_nightly

Options:
    --version, -v, version    print $PRODUCT_NAME version
    --help, -h, help          print this help
EOF
}

function update_asdf_neovim_master() {
  echo "neovim (latest)master found!"
  asdf uninstall neovim ref:master
  asdf install neovim ref:master
}

function update_asdf_neovim_stable() {
  VERSION=$("$ASDF_DIR/installs/neovim/stable/bin/nvim" --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$VERSION" != "$NEW_VERSION" ]; then
    echo "neovim (latest)stable found!"
    asdf uninstall neovim stable
    asdf install neovim stable
  else
    echo "neovim (latest)stable is already installed"
    echo "version: $VERSION"
  fi
}

function update_asdf_neovim_nightly() {
  VERSION=$("$ASDF_DIR/installs/neovim/nightly/bin/nvim" --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$VERSION" != "$NEW_VERSION" ]; then
    echo "neovim (latest)nightly found!"
    asdf uninstall neovim nightly
    asdf install neovim nightly
  else
    echo "neovim (latest)nightly is already installed"
    echo "version: $VERSION"
  fi
}

function pueue_update_asdf_neovim_master() {
  echo "Update neovim (latest)master!"
  asdf uninstall neovim ref:master
  pueue add -- 'asdf install neovim ref:master'
}

function pueue_update_asdf_neovim_nightly() {
  NVIM_VERSION=$(nvim --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NVIM_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$NVIM_VERSION" != "$NVIM_NEW_VERSION" ]; then
    echo "neovim (latest)nightly found!"
    asdf uninstall neovim nightly
    pueue add -- 'asdf install neovim nightly'
  else
    echo "neovim (latest)nightly is already installed"
    echo "version: $NVIM_VERSION"
  fi
}

function pueue_update_asdf_neovim_stable() {
  VERSION=$("$ASDF_DIR/installs/neovim/stable/bin/nvim" --version | head -n 1 | tr " " "\n" | sed -n '2p')
  NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

  if [ "$VERSION" != "$NEW_VERSION" ]; then
    echo "Update neovim (latest)stable!"
    asdf uninstall neovim stable
    pueue add -- 'asdf install neovim stable'
  else
    echo "neovim (latest)stable is already installed"
    echo "version: $VERSION"
  fi
}

# バージョン情報出力
version() {
  echo "$PRODUCT_NAME(bash) v$PRODUCT_VERSION"
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
  master | stable | nightly | pueue_master | pueue_stable | pueue_nightly)
    cmd=$1
    shift
    ;;
  *)
    break
    ;;
  esac
done

case $cmd in
master)
  update_asdf_neovim_master
  ;;
stable)
  update_asdf_neovim_stable
  ;;
nightly)
  update_asdf_neovim_nightly
  ;;
pueue_master)
  pueue_update_asdf_neovim_master
  ;;
pueue_stable)
  pueue_update_asdf_neovim_stable
  ;;
pueue_nightly)
  pueue_update_asdf_neovim_nightly
  ;;
*)
  usage
  exit 1
  ;;
esac
