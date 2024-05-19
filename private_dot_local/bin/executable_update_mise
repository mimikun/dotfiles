#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.7.0"
PRODUCT_NAME="$(basename "${0}")"
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

function _paleovim_master() {
    local commit_hash_file
    commit_hash_file="$HOME/.cache/paleovim-master-commit-hash.txt"
    local commit_hash
    commit_hash=$(cat "$commit_hash_file")
    local new_commit_hash
    new_commit_hash=$(git ls-remote --heads --tags https://github.com/vim/vim.git | grep refs/heads/master | cut -f 1)

    if [ "$commit_hash" != "$new_commit_hash" ]; then
        echo "paleovim (latest)master found!"
        echo "$new_commit_hash" >"$commit_hash_file"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall vim@ref:master")
            pueue add --after "$task_id" -- "mise install vim@ref:master"
        else
            mise uninstall vim@ref:master
            mise install vim@ref:master
        fi
    else
        echo "paleovim (latest)master is already installed"
        echo "commit hash: $commit_hash"
    fi
}

function _paleovim_latest() {
    local version
    version=$(mise current vim)
    local new_version
    new_version=$(mise latest vim)

    if [ "$version" != "$new_version" ]; then
        echo "paleovim latest version ( $new_version) found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall vim@latest")
            pueue add --after "$task_id" -- "mise install vim@latest"
        else
            mise uninstall "vim@latest"
            mise install "vim@latest"
        fi
    else
        echo "paleovim latest version ( $new_version ) is already installed"
    fi
}

function _zig_master() {
    local zig_version_file
    zig_version_file="$HOME/.cache/zig-master-version.txt"
    local zig_version
    zig_version=$(cat "$zig_version_file")
    local new_zig_version
    new_zig_version=$(curl -sSL https://ziglang.org/download/index.json | jq .master.version --raw-output)

    if [ "$zig_version" != "$new_zig_version" ]; then
        echo "zig (latest)master found!"
        echo "$new_zig_version" >"$zig_version_file"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall zig@ref:master")
            pueue add --after "$task_id" -- "mise install zig@ref:master"
        else
            mise uninstall zig@ref:master
            mise install zig@ref:master
        fi
    else
        echo "zig (latest)master is already installed"
        echo "version: $zig_version"
    fi
}

function _zig_latest() {
    local version
    version=$("$MISE_ZIG_BINDIR/latest/$BIN_ZIG" version)
    local new_version
    new_version=$(mise latest zig)

    if [ "$version" != "$new_version" ]; then
        echo "zig (latest)master found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall zig@$version")
            pueue add --after "$task_id" -- "mise install zig@$new_version"
        else
            mise uninstall "zig@$version"
            mise install "zig@$new_version"
        fi
    else
        echo "zig (latest)master ( $version ) is already installed"
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
