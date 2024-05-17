#!/bin/bash

COMPLETIONS_DIR="$HOME/.config/fish/completions"

command_exist() {
  if type "$1" >/dev/null 2>&1; then
    return 0
  else
    echo "$1: not found"
    return 1
  fi
}

update_sharkdp_tool_completions() {
  CMD_NAME="$1"
  REPO_NAME="sharkdp/$CMD_NAME"
  CMD_VERSION=$(curl --silent "https://api.github.com/repos/$REPO_NAME/releases/latest" | jq .tag_name -r)
  ARCHIVE_NAME="$CMD_NAME-$CMD_VERSION-x86_64-unknown-linux-gnu"
  ARCHIVE_FORMAT="tar.gz"
  ARCHIVE_FILE="$ARCHIVE_NAME.$ARCHIVE_FORMAT"
  DOWNLOAD_URL="https://github.com/$REPO_NAME/releases/download/$CMD_VERSION/$ARCHIVE_FILE"
  pushd /tmp || exit
  USTC_TASK_ID=$(pueue add -p -- "wget $DOWNLOAD_URL")
  USTC_TASK_ID=$(pueue add --after "$USTC_TASK_ID" -p -- "tar xvf $ARCHIVE_FILE")
  USTC_TASK_ID=$(pueue add --after "$USTC_TASK_ID" -p -- "cp $ARCHIVE_NAME/autocomplete/$CMD_NAME.fish $COMPLETIONS_DIR/$CMD_NAME.fish")
  pueue add --after "$USTC_TASK_ID" -- "rm -rf $ARCHIVE_FILE*"
  popd || exit
}

pueue add -- "fish -c 'fish_update_completions'"

for cmd in "poetry" "rustup" "starship" "deno" "mdbook"; do
  if command_exist "${cmd}"; then
    pueue add -- "'${cmd}' completions fish > '${COMPLETIONS_DIR}'/'${cmd}'.fish"
  fi
done

if command_exist bun; then
  pueue add -- "bun completions"
fi

for cmd in "chezmoi" "flyctl" "runme" "bin" "mise" "luarocks" "gopass" "glow" "pnpm"; do
  if command_exist "${cmd}"; then
    pueue add -- "'${cmd}' completion fish > '${COMPLETIONS_DIR}'/'${cmd}'.fish"
  fi
done

if command_exist yq; then
  pueue add -- "yq shell-completion fish > '${COMPLETIONS_DIR}'/yq.fish"
fi

if command_exist gh; then
  pueue add -- "gh completion -s fish > '${COMPLETIONS_DIR}'/gh.fish"
fi

if command_exist fd; then
  pueue add -- "fd --gen-completions fish > '${COMPLETIONS_DIR}'/fd.fish"
fi

if command_exist zellij; then
  pueue add -- "zellij setup --generate-completion fish > '${COMPLETIONS_DIR}'/zellij.fish"
fi

if command_exist pipx; then
  pueue add -- "register-python-argcomplete --shell fish pipx > '${COMPLETIONS_DIR}'/pipx.fish"
fi

if command_exist wezterm; then
  pueue add -- "wezterm shell-completion --shell fish > '${COMPLETIONS_DIR}'/wezterm.fish"
fi

if command_exist rye; then
  pueue add -- "rye self completion -s fish > '${COMPLETIONS_DIR}'/rye.fish"
fi

if command_exist procs; then
  pueue add -- "procs --gen-completion-out fish > '${COMPLETIONS_DIR}'/procs.fish"
fi

if command_exist pueue; then
  pueue add -- "pueue completions fish '${COMPLETIONS_DIR}'"
fi

if command_exist sheldon; then
  pueue add -- "sheldon completions --shell fish > '${COMPLETIONS_DIR}'/sheldon.fish"
fi

if command_exist rbw; then
  pueue add -- "rbw gen-completions fish > '${COMPLETIONS_DIR}'/rbw.fish"
fi

if command_exist brew; then
  pueue add -- "cp $(brew --prefix)/Homebrew/completions/fish/brew.fish ${COMPLETIONS_DIR}/brew.fish"
fi

if command_exist eza; then
  pueue add -- "curl -L https://raw.githubusercontent.com/eza-community/eza/main/completions/fish/eza.fish -o '${COMPLETIONS_DIR}'/eza.fish"
fi

if command_exist tldr; then
  pueue add -- "curl -L https://raw.githubusercontent.com/dbrgn/tealdeer/main/completion/fish_tealdeer -o '${COMPLETIONS_DIR}'/tldr.fish"
fi

if command_exist zoxide; then
  pueue add -- "curl -L https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/contrib/completions/zoxide.fish -o '${COMPLETIONS_DIR}'/zoxide.fish"
fi

if command_exist http; then
  pueue add -- "curl -L https://raw.githubusercontent.com/httpie/httpie/master/extras/httpie-completion.fish -o '${COMPLETIONS_DIR}'/http.fish"
  pueue add -- "curl -L https://raw.githubusercontent.com/httpie/httpie/master/extras/httpie-completion.fish -o '${COMPLETIONS_DIR}'/https.fish"
fi

if command_exist bat; then
  pueue add -- "update_bat_fish_completion"
fi

if command_exist rg; then
  pueue add -- "rg --generate complete-fish > '${COMPLETIONS_DIR}'/rg.fish"
fi

if command_exist hx; then
  pueue add -- "curl -L https://raw.githubusercontent.com/helix-editor/helix/master/contrib/completion/hx.fish -o '${COMPLETIONS_DIR}'/hx.fish"
fi

if command_exist hyperfine; then
  pueue add -- "update_hyperfine_fish_completion"
fi

if command_exist pastel; then
  pueue add -- "update_pastel_fish_completion"
fi

if command_exist alacritty; then
  pueue add -- "curl -L https://raw.githubusercontent.com/alacritty/alacritty/master/extra/completions/alacritty.fish -o '${COMPLETIONS_DIR}'/alacritty.fish"
fi

if command_exist uv; then
  pueue add -- "uv --generate-shell-completion fish > '${COMPLETIONS_DIR}'/uv.fish"
fi

if command_exist ghq; then
  pueue add -- "curl -L https://raw.githubusercontent.com/x-motemen/ghq/master/misc/fish/ghq.fish -o '${COMPLETIONS_DIR}'/ghq.fish"
fi

if command_exist fish-lsp; then
  pueue add -- "fish-lsp complete --fish > '${COMPLETIONS_DIR}'/fish-lsp.fish"
fi

for cmd in "bat" "hyperfine" "pastel"; do
  if command_exist "${cmd}"; then
    update_sharkdp_tool_completions "${cmd}"
  fi
done
