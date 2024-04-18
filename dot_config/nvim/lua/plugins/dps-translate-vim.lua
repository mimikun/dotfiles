local global = require("core.global")

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
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("dps-translate-vim")

        vim.g.dps_translate_source = "en"
        vim.g.dps_translate_target = "ja"
    end,
    -- Disable if there are no human rights
    cond = global.is_human_rights,
}

return spec
