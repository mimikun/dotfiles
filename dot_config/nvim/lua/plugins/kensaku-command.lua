local global = require("core.global")

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "lambdalisue/kensaku.vim",
}

---@type LazySpec
local spec = {
    "lambdalisue/kensaku-command.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Kensaku",
    dependencies = dependencies,
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("kensaku-command.vim")
    end,
    -- Disable if there are no human rights
    cond = global.is_human_rights,
}

return spec
