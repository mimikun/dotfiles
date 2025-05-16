# built-in sections config
# NOTE: Only the parts that have been changed from the default are listed.

# battery
SPACESHIP_BATTERY_SHOW="always"
SPACESHIP_BATTERY_THRESHOLD=20

# char
SPACESHIP_CHAR_SYMBOL_ROOT="#"

# directory
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=false

# exit code
SPACESHIP_EXIT_CODE_SHOW=true

# git
SPACESHIP_GIT_BRANCH_ASYNC=true

# hostname
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_SHOW_FULL=true

# nix-shell
SPACESHIP_NIX_SHELL_ASYNC=true

# time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%D{%H:%M:%S.%.}'

# virtualenv
SPACESHIP_VENV_ASYNC=true

# add custom sections

# https://github.com/spaceship-prompt/spaceship-vi-mode
spaceship add --before char vi_mode

# https://github.com/spaceship-prompt/spaceship-gradle
#spaceship add gradle

# https://github.com/spaceship-prompt/spaceship-maven
#spaceship add maven

# https://github.com/spaceship-prompt/spaceship-react
#spaceship add react

# https://github.com/spaceship-prompt/spaceship-vue
#spaceship add vue

# https://github.com/spaceship-prompt/spaceship-ember
#spaceship add ember

# https://github.com/spaceship-prompt/spaceship-flutter
#spaceship add flutter

# https://github.com/windwhinny/spaceship-arch
#spaceship add arch

# https://github.com/TheArqsz/spaceship-ip
#spaceship add ip

# https://github.com/noraj/spaceship-current-netns
#spaceship add current-netns

# https://github.com/pipoprods/spaceship-taskwarrior
#spaceship add taskwarrior

# https://github.com/pipoprods/spaceship-debian-chroot
#spaceship add --before char debian_chroot

# custom sections config
# NOTE: Only the parts that have been changed from the default are listed.

# vi_mode
SPACESHIP_VI_MODE_INSERT="[INSERT]"
SPACESHIP_VI_MODE_NORMAL="[NORMAL]"


# ------------------------------------------------
# TODO: it

# Left prompt
SPACESHIP_PROMPT_ORDER=(
  user           # Username section
  dir            # Current directory section
  host           # Hostname section
  git            # Git section (git_branch + git_status)
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
  elm            # Elm section
  elixir         # Elixir section
  xcode          # Xcode section
  swift          # Swift section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  haskell        # Haskell Stack section
  scala          # Scala section
  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  julia          # Julia section
  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  venv           # virtualenv section
  conda          # conda virtualenv section
  uv             # uv section
  dotnet         # .NET section
  ocaml          # OCaml section
  vlang          # V section
  zig            # Zig section
  purescript     # PureScript section
  erlang         # Erlang section
  gleam          # Gleam section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

# Right prompt
SPACESHIP_RPROMPT_ORDER=(
  time           # Time stamps section
  battery        # Battery level and status
)

