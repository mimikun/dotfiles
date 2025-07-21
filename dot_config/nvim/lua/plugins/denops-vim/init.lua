---@type boolean
local use_denops = require("config.settings").use_denops

---@type LazySpec
local spec = {
    "vim-denops/denops.vim",
    lazy = false,
    cond = use_denops,
    enabled = use_denops,
}

return spec
