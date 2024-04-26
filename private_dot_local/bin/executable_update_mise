#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.5.0"
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
    local commit_hash_file
    commit_hash_file="$HOME/.cache/neovim-master-commit-hash.txt"
    local commit_hash
    commit_hash=$(cat "$commit_hash_file")
    local new_commit_hash
    new_commit_hash=$(git ls-remote --heads --tags https://github.com/neovim/neovim.git | grep refs/heads/master | cut -f 1)

    if [ "$commit_hash" != "$new_commit_hash" ]; then
        echo "neovim (latest)master found!"
        echo "$new_commit_hash" >"$commit_hash_file"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@ref:master")
            pueue add --after "$task_id" -- "mise install neovim@ref:master"
        else
            mise uninstall neovim@ref:master
            mise install neovim@ref:master
        fi
    else
        echo "neovim (latest)master is already installed"
        echo "commit hash: $commit_hash"
    fi
}

function _neovim_nightly() {
    local version
    version=$("$MISE_NEOVIM_BINDIR/nightly/$BIN_NVIM" --version | head -n 1 | tr " " "\n" | sed -n '2p')
    local new_version
    new_version=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/nightly | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

    if [ "$version" != "$new_version" ]; then
        echo "neovim (latest)nightly found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@nightly")
            pueue add --after "$task_id" -- "mise install neovim@nightly"
        else
            mise uninstall neovim@nightly
            mise install neovim@nightly
        fi
    else
        echo "neovim (latest)nightly ( $version )is already installed"
    fi
}

function _neovim_stable() {
    local version
    version=$("$MISE_NEOVIM_BINDIR/stable/$BIN_NVIM" --version | head -n 1 | tr " " "\n" | sed -n '2p')
    local new_version
    new_version=$(curl --silent https://api.github.com/repos/neovim/neovim/releases/tags/stable | jq .body | tr " " "\n" | sed -n 2p | sed -e "s/\\\nBuild//g")

    if [ "$version" != "$new_version" ]; then
        echo "neovim (latest)stable found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall neovim@stable")
            pueue add --after "$task_id" -- "mise install neovim@stable"
        else
            mise uninstall neovim@stable
            mise install neovim@stable
        fi
    else
        echo "neovim (latest)stable ( $version )is already installed"
    fi
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
    local version
    version=$("$MISE_ZIG_BINDIR/master/$BIN_ZIG" version)
    local new_version
    new_version=$(curl -sSL https://ziglang.org/download/index.json | jq .master.version --raw-output)

    if [ "$version" != "$new_version" ]; then
        echo "zig (latest)master found!"
        if [ "$opt" == "--use-pueue" ]; then
            task_id=$(pueue add -p -- "mise uninstall zig@master")
            pueue add --after "$task_id" -- "mise install zig@master"
        else
            mise uninstall zig@master
            mise install zig@master
        fi
    else
        echo "zig (latest)master ( $version ) is already installed"
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
