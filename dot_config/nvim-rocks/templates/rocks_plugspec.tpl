;; toml
#[plugins."rocks-spec-template.nvim"]
# NOTE: rocks.nvim RockSpec
#---@type string The rock version
#version = ""
#---@type boolean Set to `true` to prevent rocks from being loaded eagerly
#opt = true
#---@type boolean Pinned rocks will not be updated
#pin = false
# NOTE: rocks-git.nvim additional RockSpec
#---@type string Name of the plugin.
#name = "rockspec-template"
#---@type string Git short name, e.g. 'nvim-neorocks/rocks-git.nvim', or a git URL.
#git = "mimikun/rocks-spec-template.nvim"
# WARN: duplicate rocks.nvim RockSpec's opt parameter
#---@type boolean If 'true', will not be loaded on startup. Can be loaded manually with `:packadd!`.
#opt = true
#---@type string Git revision or tag to checkout.
#rev = ""
#---@type string Git branch to checkout.
#branch = ""
#---@type string Shell or Vimscript command to run after install/update. Will run a vim command if prefixed with ':'.
#build = ""
#---@type boolean Ignore tags when updating and prioritise git revisions. default `false`
#ignore_tags = false
# NOTE: rocks-config.nvim additional RockSpec
#---@type string Will execute `.config/nvim/lua/plugins/statusline.lua`
#config = "plugins.statusline"
# NOTE: rocks-dev.nvim additional RockSpec
#---@type string local plugin directory
#dir = "/path/to/mimikun/rocksspec-template.nvim"
#---@type boolean If set dev.path, and `dev = true`, can loading local plugins.
#dev = false
# NOTE: rocks-lazy.nvim additional RockSpec
#---@type string? | string[] Lazy-load on an event (`:h autocmd-events`).
#event = "BufEnter"
#---@type string? | string[] Lazy-load on a command (`:h user-commands`).
#cmd = "Cmdname"
#---@type string? | string[] Lazy-load on a `:h filetype` event.
#ft = "lua"
#---@type string? | string[] | rocks.lazy.KeysSpec[] Lazy-load on key mappings.
#keys = [{ lhs = "<leader>ft", rhs = "<CMD>Neotree toggle<CR>", desc = "NeoTree toggle" },]
#---@type string? | string[] Lazy-load when setting a colorscheme.
#colorscheme = [
#    "kanagawa",
#    "kanagawa-dragon",
#    "kanagawa-lotus",
#    "kanagawa-wave"
#]
# NOTE: rocks.lazy.KeysSpec
#- `rocks.lazy.KeysSpec`: table
#    - `lhs`: `string`
#    - `rhs`: `string?`
#    - `mode`: `string?` or `string[]` (default: `"n"`)
#    - `[string]`: Options, see `:h vim.keymap.set`
