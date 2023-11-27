#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.8.0"
PRODUCT_NAME="$(basename "${0}")"
OS_INFO=$(os_info -t)

readonly UBUNTU_OS="OS type: Ubuntu"
readonly ARCH_OS="OS type: Arch Linux"
readonly ENDEAVOUR_OS="OS type: EndeavourOS"
readonly MAC_OS="OS type: Mac OS"

#=======================
# 関数定義
#=======================

# 使い方、ヘルプメッセージ
usage() {
  cat <<EOF
$PRODUCT_NAME
Tools to update various packages and commands using pueue. (for mimikun)

Usage:
    $PRODUCT_NAME

Options:
    --version, -v, version    print $PRODUCT_NAME version
    --help, -h, help          print this help
EOF
}

# バージョン情報出力
version() {
  echo "$PRODUCT_NAME"
  echo "v$PRODUCT_VERSION"
}

# magic
before_sudo() {
  if ! test "$(
    sudo uname >>/dev/null
    echo $?
  )" -eq 0; then
    exit 1
  fi
}

# Ubuntu
ubuntu() {
  # Upgrade APT repogitory list
  sudo apt update
  # Upgrade APT packages
  sudo apt upgrade -y
  # Cleaning APT caches
  sudo apt autoremove -y
  sudo apt-get clean
  brew_update
}

# Arch Linux
arch() {
  echo "Run yay..."
  pueue add -- "yay"
  pueue add -- "yay -Sc"
}

# Mac
mac() {
  brew_update
}

update_asdf_tools() {
  for i in $(asdf plugin list); do
    echo "asdf install $i latest"
    pueue add -- "asdf install $i latest"
  done
}

pueue_update_asdf_nodejs_lts() {
  nodejs_lts_ver=$(asdf nodejs resolve lts --latest-available)
  pueue add -- "asdf install nodejs $nodejs_lts_ver"
}

# other
other_tools() {
  # Upgrade Rust toolchains
  echo "rustup update"
  pueue add -- "rustup update"

  # Upgrade deno
  echo "deno upgrade"
  pueue add -- "deno upgrade"

  # Upgrade bun
  echo "bun upgrade"
  pueue add -- "bun upgrade"

  # Upgrade asdf
  echo "asdf update"
  pueue add -- "asdf update"

  # tldr update
  echo "tldr --update"
  pueue add -- "tldr --update"

  # GitHub CLI extensions update
  echo "gh extensions upgrade --all"
  pueue add -- "gh extensions upgrade --all"

  # flyctl upgrade
  echo "flyctl version upgrade"
  pueue add -- "flyctl version upgrade"

  # pnpm
  echo "update_pnpm"
  pueue add -- "update_pnpm"
}

no_pueue_other_tools() {
  # Upgrade fisher
  fish -c 'fisher update'

  asdf plugin update --all
  update_asdf_tools

  echo "asdf install neovim ref:master"
  update_asdf_neovim master --use-pueue

  echo "asdf install neovim stable"
  update_asdf_neovim stable --use-pueue

  echo "asdf install neovim nightly"
  update_asdf_neovim nightly --use-pueue

  echo "asdf install zig master"
  pueue_update_asdf_zig_master

  echo "asdf install nodejs lts"
  pueue_update_asdf_nodejs_lts

  # Update rust tools
  echo "update_cargo_packages"
  pueue_update_cargo_packages

  # Create cargo_packages.txt
  echo "generate_cargo_package_list"
  generate_cargo_package_list

  # Create asdf_plugin_list.txt
  echo "generate_asdf_plugin_list"
  generate_asdf_plugin_list

  echo "update_fish_completions"
  update_fish_completions

  echo "gup update"
  pueue add -- "gup update"

  echo "gup export"
  pueue add -- "gup export"

  # Upgrade docker-compose
  echo "update_docker_compose"
  update_docker_compose

  # Upgrade chromedriver
  echo "update_chromedriver"
  update_chromedriver

  # Upgrade geckodriver
  echo "update_geckodriver"
  update_geckodriver

  # Upgrade twitch-cli
  echo "update_twitch_cli"
  update_twitch_cli

  # Upgrade pkgx
  echo "update_pkgx"
  update_pkgx
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
  *)
    break
    ;;
  esac
done

before_sudo

# OSごとで処理を分岐
case "$OS_INFO" in
"$UBUNTU_OS") ubuntu ;;
"$MAC_OS") mac ;;
"$ARCH_OS") arch ;;
"$ENDEAVOUR_OS") arch ;;
*) echo "This distro NOT support." ;;
esac

# 共通の処理
other_tools
no_pueue_other_tools

# ファイルがあれば再起動を促す
if test -e /var/run/reboot-required; then
  # WSL かチェックする
  if test ! -e /proc/sys/fs/binfmt_misc/WSLInterop; then
    echo "\"/var/run/reboot-required\" exists. Reboot the system?(recommend)"
    re_boot
  fi
fi
