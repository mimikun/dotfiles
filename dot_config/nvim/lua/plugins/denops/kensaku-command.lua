--- Disable if there are no human rights
---@type boolean
local cond = require("core.global").is_human_rights

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
    cmd = "Kensaku",
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("vim-kensaku-command")
    end,
    cond = cond,
}

return spec
