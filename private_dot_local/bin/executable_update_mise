#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.4.0"
PRODUCT_NAME="$(basename "${0}")"
readonly MISE_NEOVIM_BINDIR="$MISE_DATA_DIR/installs/neovim"
readonly BIN_NVIM="bin/nvim"
readonly MISE_ZIG_BINDIR="$MISE_DATA_DIR/installs/zig"
readonly BIN_ZIG="bin/zig"

#=======================
# 関数定義
#=======================

# 使い方、ヘルプメッセージ
usage() {
    cat <<EOF
$PRODUCT_NAME(bash)
Update mise-tools

Usage:
    $PRODUCT_NAME <COMMAND> <SUBCOMMANDS>

Commands:
    neovim-master                  Run update mise neovim master
    neovim-stable                  Run update mise neovim stable
    neovim-nightly                 Run update mise neovim nightly
    paleovim-master                Run update mise paleovim master
    paleovim-latest                Run update mise paleovim latest
    zig-master                     Run update mise zig master
    zig-latest                     Run update mise zig latest

Command options:
    --use-pueue                    Run command with pueue

Options:
    --version, -v, version         print $PRODUCT_NAME version
    --help, -h, help               print this help
EOF
}

# バージョン情報出力
version() {
    echo "$PRODUCT_NAME(bash) v$PRODUCT_VERSION"
}

function _neovim_master() {
    NVIM_MASTER_COMMIT_HASH_FILE=$HOME/.cache/neovim-master-commit-hash.txt
    NVIM_MASTER_COMMIT_HASH=$(cat "$NVIM_MASTER_COMMIT_HASH_FILE")
    NVIM_MASTER_NEW_COMMIT_HASH=$(git ls-remote --heads --tags https://github.com/neovim/neovim.git | grep refs/heads/master | cut -f 1)

    if [ "$NVIM_MASTER_COMMIT_HASH" != "$NVIM_MASTER_NEW_COMMIT_HASH" ]; then
        echo "neovim (latest)master found!"
        echo "$NVIM_MASTER_NEW_COMMIT_HASH" >"$NVIM_MASTER_COMMIT_HASH_FILE"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@ref:master")
            pueue add --after "$task_id" -- "mise install neovim@ref:master"
        else
            mise uninstall neovim@ref:master
            mise install neovim@ref:master
        fi
    else
        echo "neovim (latest)master is already installed"
        echo "commit hash: $MASTER_COMMIT_HASH"
    fi
}

function _neovim_nightly() {
    NVIM_NIGHTLY_VERSION=$("$MISE_NEOVIM_BINDIR/nightly/$BIN_NVIM" --version | head -n 1 | tr " " "\n" | sed -n '2p')
    NVIM_NIGHTLY_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

    if [ "$NVIM_NIGHTLY_VERSION" != "$NVIM_NIGHTLY_NEW_VERSION" ]; then
        echo "neovim (latest)nightly found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@nightly")
            pueue add --after "$task_id" -- "mise install neovim@nightly"
        else
            mise uninstall neovim@nightly
            mise install neovim@nightly
        fi
    else
        echo "neovim (latest)nightly is already installed"
        echo "version: $NVIM_NIGHTLY_VERSION"
    fi
}

function _neovim_stable() {
    NVIM_STABLE_VERSION=$("$MISE_NEOVIM_BINDIR/stable/$BIN_NVIM" --version | head -n 1 | tr " " "\n" | sed -n '2p')
    NVIM_STABLE_NEW_VERSION=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

    if [ "$NVIM_STABLE_VERSION" != "$NVIM_STABLE_NEW_VERSION" ]; then
        echo "neovim (latest)stable found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@stable")
            pueue add --after "$task_id" -- "mise install neovim@stable"
        else
            mise uninstall neovim@stable
            mise install neovim@stable
        fi
    else
        echo "neovim (latest)stable is already installed"
        echo "version: $NVIM_STABLE_VERSION"
    fi
}

function _paleovim_master() {
    PVIM_MASTER_COMMIT_HASH_FILE=$HOME/.cache/paleovim-master-commit-hash.txt
    PVIM_MASTER_COMMIT_HASH=$(cat "$PVIM_MASTER_COMMIT_HASH_FILE")
    PVIM_MASTER_NEW_COMMIT_HASH=$(git ls-remote --heads --tags https://github.com/vim/vim.git | grep refs/heads/master | cut -f 1)

    if [ "$PVIM_MASTER_COMMIT_HASH" != "$PVIM_MASTER_NEW_COMMIT_HASH" ]; then
        echo "paleovim (latest)master found!"
        echo "$PVIM_MASTER_NEW_COMMIT_HASH" >"$PVIM_MASTER_COMMIT_HASH_FILE"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall vim@ref:master")
            pueue add --after "$task_id" -- "mise install vim@ref:master"
        else
            mise uninstall vim@ref:master
            mise install vim@ref:master
        fi
    else
        echo "paleovim (latest)master is already installed"
        echo "commit hash: $PVIM_MASTER_COMMIT_HASH"
    fi
}

function _paleovim_latest() {
    PVIM_SECOND_LATEST_VERSION_FILE=$XDG_CACHE_HOME/paleovim-second-latest-version.txt
    PVIM_SECOND_LATEST_VERSION=$(cat "$PVIM_SECOND_LATEST_VERSION_FILE")
    PVIM_LATEST_VERSION=$(curl --silent https://api.github.com/repos/vim/vim/tags | jq .[0].name --raw-output | sed -e "s/^v//g")

    if [ "$PVIM_SECOND_LATEST_VERSION" != "$PVIM_LATEST_VERSION" ]; then
        echo "paleovim latest version ( $PVIM_LATEST_VERSION ) found!"
        echo "$PVIM_LATEST_VERSION" >"$PVIM_SECOND_LATEST_VERSION_FILE"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall vim@$PVIM_SECOND_LATEST_VERSION")
            pueue add --after "$task_id" -- "mise install vim@$PVIM_LATEST_VERSION"
        else
            mise uninstall "vim@$PVIM_SECOND_LATEST_VERSION"
            mise install "vim@$PVIM_LATEST_VERSION"
        fi
    else
        echo "paleovim latest version ( $PVIM_LATEST_VERSION ) is already installed"
    fi
}

function _zig_master() {
    ZIG_VERSION=$("$MISE_ZIG_BINDIR/master/$BIN_ZIG" version)
    ZIG_NEW_VERSION=$(curl -sSL https://ziglang.org/download/index.json | jq .master.version --raw-output)

    if [ "$ZIG_VERSION" != "$ZIG_NEW_VERSION" ]; then
        echo "zig (latest)master found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall zig@master")
            pueue add --after "$task_id" -- "mise install zig@master"
        else
            mise uninstall zig@master
            mise install zig@master
        fi
    else
        echo "zig (latest)master is already installed"
        echo "version: $ZIG_VERSION"
    fi
}

function _zig_latest() {
    ZIG_VERSION=$("$MISE_ZIG_BINDIR/latest/$BIN_ZIG" version)
    ZIG_NEW_VERSION=$(mise latest zig)

    if [ "$ZIG_VERSION" != "$ZIG_NEW_VERSION" ]; then
        echo "zig (latest)master found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall zig@$ZIG_VERSION")
            pueue add --after "$task_id" -- "mise install zig@$ZIG_NEW_VERSION"
        else
            mise uninstall "zig@$ZIG_VERSION"
            mise install "zig@$ZIG_NEW_VERSION"
        fi
    else
        echo "zig (latest)master is already installed"
        echo "version: $ZIG_VERSION"
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
    neovim-master | neovim-stable | neovim-nightly | \
        paleovim-master | paleovim-latest | zig-master | zig-latest)
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
neovim-master)
    _neovim_master "$opt"
    ;;
neovim-stable)
    _neovim_stable "$opt"
    ;;
neovim-nightly)
    _neovim_nightly "$opt"
    ;;
paleovim-master)
    _paleovim_master "$opt"
    ;;
paleovim-latest)
    _paleovim_latest "$opt"
    ;;
zig-master)
    _zig_master "$opt"
    ;;
zig-latest)
    _zig_latest "$opt"
    ;;
*)
    usage
    exit 1
    ;;
esac
