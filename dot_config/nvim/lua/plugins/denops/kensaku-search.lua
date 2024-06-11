--- Disable if there are no human rights
---@type boolean
local cond = require("core.global").is_human_rights

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
    "lambdalisue/vim-kensaku",
}

---@type table
local keys = {
    { "<CR>", desc = "kensaku-search-replace" },
}

local spec = {
    "lambdalisue/vim-kensaku-search",
    --lazy = false,
    keys = keys,
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("vim-kensaku-search")

        vim.set.keymap("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", { noremap = true })
    end,
    cond = cond,
}

return spec
