local global = require("core.global")

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "lambdalisue/vim-kensaku",
}

---@type LazySpec
local spec = {
    "lambdalisue/vim-kensaku-command",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Kensaku",
    dependencies = dependencies,
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("vim-kensaku-command")
    end,
    -- Disable if there are no human rights
    cond = global.is_human_rights,
}

return spec
