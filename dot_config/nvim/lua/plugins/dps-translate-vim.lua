-- Disable if there are no human rights
---@type boolean
local is_human_rights = require("config.global").is_human_rights

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "Omochice/dps-translate-vim",
    --lazy = false,
    cmd = "Translate",
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("dps-translate-vim")

        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    cond = is_human_rights,
    enabled = is_human_rights,
}

return spec
