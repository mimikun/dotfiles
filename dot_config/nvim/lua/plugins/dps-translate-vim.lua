---@type boolean
local cond = require("config.global").is_home

---@type LazySpec
local spec = {
    "Omochice/dps-translate-vim",
    lazy = false,
    cmd = "Translate",
    --event = "User DenopsReady",
    dependencies = { "vim-denops/denops.vim" },
    init = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    cond = cond,
    enabled = cond,
}

return spec
