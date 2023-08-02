#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="0.1.0"
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

# Ubuntu
ubuntu() {
  # Upgrade APT repogitory list
  sudo apt update
  # Upgrade APT packages
  sudo apt upgrade -y
  # Cleaning APT caches
  sudo apt autoremove -y
  sudo apt-get clean
  # Upgrade snaps
  sudo snap refresh
}

# Arch Linux
arch() {
  yay
  yay -Sc
}

# Mac
mac() {
  brew update
  brew upgrade
  brew upgrade --cask
  brew cleanup
}

update_asdf_tools() {
  for i in $(asdf plugin list); do
    asdf install "$i" latest
  done
}

update_asdf_nodejs_lts() {
  asdf uninstall nodejs lts
  asdf install nodejs lts
}

# other
ohter_tools() {
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
  # tldr update
  tldr --update
  # GitHub CLI extensions update
  gh extensions upgrade --all
  # Upgrade fisher
  fish -c 'fisher update'
  asdf plugin update --all
  update_asdf_tools
  update_asdf_neovim_nightly
  update_asdf_zig_master
  # Update rust tools
  update_cargo_packages
  # Create cargo_packages.txt
  generate_cargo_package_list
  # Create asdf_plugin_list.txt
  asdf plugin list --urls >~/asdf_plugin_list.txt
  update_fish_completions
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
ohter_tools

# ファイルがあれば再起動を促す
if test -e /var/run/reboot-required; then
  echo "\"/var/run/reboot-required\" exists. Reboot the system?(recommend)"
  re_boot
fi
