---@type boolean
local is_human_rights = require("config.global").is_human_rights

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
        require("denops-lazy").load("vim-kensaku-command")
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

return spec
