#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.5.0"
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
Tools to update various packages and commands. (for mimikun)

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

# brew upgrade commands
brew_update_process() {
  brew update
  brew upgrade
  brew upgrade --cask
  brew cleanup
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
  which brew >/dev/null
  if test $? -eq 0; then
    brew_update_process
  fi
}

# Arch Linux
arch() {
  yay
  yay -Sc
}

# Mac
mac() {
  brew_update_process
}

update_asdf_tools() {
  for i in $(asdf plugin list); do
    asdf install "$i" latest
  done
}

update_asdf_nodejs_lts() {
  asdf install nodejs "$(asdf nodejs resolve lts --latest-available)"
}

# other
other_tools() {
  # Upgrade Rust toolchains
  rustup update
  # Upgrade deno
  deno upgrade
  # Upgrade bun
  bun upgrade
  # Upgrade asdf
  asdf update
  # Upgrade docker-compose
  update_docker_compose
  # Upgrade chromedriver
  update_chromedriver
  # Upgrade geckodriver
  update_geckodriver
  # Upgrade twitch cli
  update_twitch_cli
  # Upgrade pkgx
  update_pkgx
  # tldr update
  tldr --update
  # GitHub CLI extensions update
  gh extensions upgrade --all
  # flyctl upgrade
  flyctl version upgrade
  # Upgrade fisher
  fish -c 'fisher update'
  asdf plugin update --all
  update_asdf_tools
  update_asdf_neovim master
  update_asdf_neovim stable
  update_asdf_neovim nightly
  update_asdf_zig_master
  # Update rust tools
  update_cargo_packages
  # Create cargo_packages.txt
  generate_cargo_package_list
  # Create asdf_plugin_list.txt
  generate_asdf_plugin_list
  update_fish_completions
  # Update golang tools
  gup update
  # Create golang package list
  gup export
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

# ファイルがあれば再起動を促す
if test -e /var/run/reboot-required; then
  # WSL かチェックする
  if test ! -e /proc/sys/fs/binfmt_misc/WSLInterop; then
    echo "\"/var/run/reboot-required\" exists. Reboot the system?(recommend)"
    re_boot
  fi
fi
