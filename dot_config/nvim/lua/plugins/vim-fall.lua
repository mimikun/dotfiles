---@type boolean
local cond = require("config.global").is_home

---@type LazySpec
local spec = {
    "vim-fall/fall.vim",
    lazy = false,
    cmd = "Fall",
    --event = "User DenopsReady",
    dependencies = { "vim-denops/denops.vim" },
    cond = cond,
    enabled = cond,
}

return spec
