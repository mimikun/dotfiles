---@type boolean
local use_denops = require("config.settings").use_denops

---@type LazySpec
local spec = {
    "Omochice/dps-translate-vim",
    lazy = false,
    cmd = "Translate",
    dependencies = { "vim-denops/denops.vim" },
    init = function()
        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    cond = use_denops,
    enabled = use_denops,
}

return spec
