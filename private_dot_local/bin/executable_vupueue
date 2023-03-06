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
  # Upgrade snaps
  sudo snap refresh
}

# Arch Linux
arch() {
  pueue add -- "yay"
  pueue add -- "yay -Sc"
}

# Mac
mac() {
  pueue add -- "brew update"
  pueue add -- "brew upgrade"
  pueue add -- "brew upgrade --cask"
  pueue add -- "brew cleanup"
}

update_asdf_tools() {
  for i in $(asdf plugin list); do
    pueue add -- "asdf install $i latest"
  done
}

pueue_update_asdf_nodejs_lts() {
  asdf uninstall nodejs lts
  pueue add -- 'asdf install nodejs lts'
}

# other
ohter_tools() {
  # Upgrade Rust toolchains
  pueue add -- "rustup update"
  # Upgrade deno
  pueue add -- "deno upgrade"
  # Upgrade bun
  pueue add -- "bun upgrade"
  # Upgrade asdf
  pueue add -- "asdf update"
  # Upgrade docker-compose
  pueue add -- "update_docker_compose"
  # Upgrade chromedriver
  pueue add -- "update_chromedriver"
  # Upgrade geckodriver
  pueue add -- "update_geckodriver"
  # tldr update
  pueue add -- "tldr --update"
  # GitHub CLI extensions update
  pueue add -- "gh extensions upgrade --all"
}

no_pueue_other_tools() {
  # Upgrade fisher
  fish -c 'fisher update'
  asdf plugin update --all
  update_asdf_tools
  pueue_update_asdf_neovim_nightly
  pueue_update_asdf_zig_master
  # Update rust tools
  pueue_update_cargo_packages
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
no_pueue_other_tools

# ファイルがあれば再起動を促す
if test -e /var/run/reboot-required; then
  echo "\"/var/run/reboot-required\" exists. Reboot the system?(recommend)"
  re_boot
fi
