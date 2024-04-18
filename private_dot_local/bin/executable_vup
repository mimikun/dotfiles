#!/bin/bash

#=======================
# 変数定義
#=======================

readonly PRODUCT_VERSION="1.3.0"
PRODUCT_NAME="$(basename "${0}")"
OS_INFO=$(os_info -t)

readonly UBUNTU_OS="OS type: Ubuntu"
readonly ARCH_OS="OS type: Arch Linux"
readonly MAC_OS="OS type: Mac OS"

#=======================
# 関数定義
#=======================

# 使い方、ヘルプメッセージ
usage() {
  cat <<EOF
$PRODUCT_NAME v$PRODUCT_VERSION
Tools to update various packages and commands. (for mimikun)

Usage:
    $PRODUCT_NAME

Options:
    --no_pueue, -n            Run without pueue
    --version, -v, version    Print $PRODUCT_NAME version
    --help, -h, help          Print this help
EOF
}

# バージョン情報出力
version() {
  echo "$PRODUCT_NAME v$PRODUCT_VERSION"
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
}

# Arch Linux
arch() {
  paru -Syu
}

# Mac
mac() {
  brew_update
}

# OSごとで処理を分岐
os_pkg_update() {
  case "$OS_INFO" in
  "$UBUNTU_OS") ubuntu ;;
  "$MAC_OS") mac ;;
  "$ARCH_OS") arch ;;
  *) echo "This distro NOT support." ;;
  esac
}

use_pueue() {
  echo "rustup update"
  rust_task_id=$(pueue add -p -- "rustup update")

  echo "deno upgrade"
  pueue add -- "deno upgrade"

  echo "bun upgrade"
  pueue add -- "bun upgrade"

  echo "mise upgrade"
  mise_task_id=$(pueue add -p -- "mise upgrade")

  echo "tldr --update"
  pueue add -- "tldr --update"

  echo "gh extensions upgrade --all"
  pueue add -- "gh extensions upgrade --all"

  echo "flyctl version upgrade"
  pueue add -- "flyctl version upgrade"

  echo "update_pnpm"
  pueue add -- "update_pnpm"

  echo "update mise tools"
  nvim_task_id=$(pueue add -p --after "$mise_task_id" -- "update_mise neovim-master --use-pueue")
  pvim_task_id=$(pueue add -p --after "$mise_task_id" -- "update_mise paleovim-master --use-pueue")
  nvim_task_id=$(pueue add -p --after "$nvim_task_id" -- "update_mise neovim-stable --use-pueue")
  pueue add --after "$nvim_task_id" -- "update_mise neovim-nightly --use-pueue"
  pueue add --after "$pvim_task_id" -- "update_mise paleovim-latest --use-pueue"
  pueue add --after "$mise_task_id" -- "update_mise zig-master --use-pueue"

  echo "fisher update"
  fish -c 'fisher update'

  echo "update_cargo_packages"
  cargo_outdated_pkgs=$(cargo install-update -l | grep "Yes" | cut -d " " -f 1)
  echo "Update these packages:"
  echo "$cargo_outdated_pkgs"
  for i in $cargo_outdated_pkgs; do
    task_id=$(pueue add -p --after "$rust_task_id" -- "cargo install $i")
  done

  echo "generate_cargo_package_list"
  if [ -n "$task_id" ]; then
    pueue add --after "$task_id" -- "generate_cargo_package_list"
  else
    pueue add -- "generate_cargo_package_list"
  fi

  echo "update_fish_completions"
  update_fish_completions

  echo "gup update"
  task_id=$(pueue add -p -- "gup update")

  echo "gup export"
  pueue add --after "$task_id" -- "gup export"

  echo "aqua i -a"
  task_id=$(pueue add -p -- "aqua i -a")

  echo "aqua up"
  pueue add --after "$task_id" -- "aqua up"
}

no_pueue() {
  echo "rustup update"
  rustup update

  echo "deno upgrade"
  deno upgrade

  echo "bun upgrade"
  bun upgrade

  echo "mise upgrade"
  mise upgrade

  echo "tldr --update"
  tldr --update

  echo "gh extensions upgrade --all"
  gh extensions upgrade --all

  echo "flyctl version upgrade"
  flyctl version upgrade

  echo "fisher update"
  fish -c 'fisher update'

  echo "update_cargo_packages"
  update_cargo_packages

  echo "generate_cargo_package_list"
  generate_cargo_package_list

  echo "update_pnpm"
  update_pnpm

  echo "update_fish_completions"
  update_fish_completions

  echo "gup update"
  gup update

  echo "gup export"
  gup export

  echo "aqua i -a"
  aqua i -a

  echo "aqua up"
  aqua up
}

other() {
  echo "update_docker_compose"
  update_docker_compose

  echo "update_chromedriver"
  update_chromedriver

  echo "update_geckodriver"
  update_geckodriver

  echo "update_twitch_cli"
  update_twitch_cli

  echo "update_pkgx"
  update_pkgx
}

reboot_check() {
  # ファイルがあれば再起動を促す
  if test -e /var/run/reboot-required; then
    # WSL かチェックする
    if test ! -e /proc/sys/fs/binfmt_misc/WSLInterop; then
      echo "\"/var/run/reboot-required\" exists. Reboot the system?(recommend)"
      re_boot
    fi
  fi
}

#=======================
# メイン処理
#=======================
before_sudo

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
  -s | -n | --no_pueue | no_pueue)
    os_pkg_update
    no_pueue
    other
    reboot_check
    exit 1
    ;;
  *)
    break
    ;;
  esac
done

os_pkg_update
use_pueue
other
reboot_check
