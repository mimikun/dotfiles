---@type boolean
local cond = require("config.global").is_home

---@type LazySpec
local spec = {
    "vim-denops/denops.vim",
    lazy = false,
    cond = cond,
    enabled = cond,
}

return spec
