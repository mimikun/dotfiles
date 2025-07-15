---@type boolean
local cond = require("config.settings").use_denops

---@type LazySpec
local spec = {
    "vim-denops/denops.vim",
    lazy = false,
    cond = cond,
    enabled = cond,
}

return spec
