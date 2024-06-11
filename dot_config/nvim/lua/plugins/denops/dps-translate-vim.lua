-- Disable if there are no human rights
---@type boolean
local cond = require("core.global").is_human_rights

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "Omochice/dps-translate-vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Translate",
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("dps-translate-vim")

        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    cond = cond,
}

return spec
