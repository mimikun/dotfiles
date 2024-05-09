local global = require("core.global")

---@type table
local keymaps = {
    { "<CR>", desc = "kensaku-search-replace" },
}

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "lambdalisue/vim-kensaku",
}

---@type LazySpec
local spec = {
    "lambdalisue/vim-kensaku-search",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = dependencies,
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("vim-kensaku-search")

        vim.set.keymap("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
    end,
    -- Disable if there are no human rights
    cond = global.is_human_rights,
}

return spec
