---@type boolean
local cond = require("config.global").is_work

---@type LazyKeysSpec[]
local keys = {
    {
        "<C-j>",
        mode = "i",
        desc = "Toggle Kana-mode eskk.vim",
    },
}

---@type LazySpec
local spec = {
    "vim-skk/eskk.vim",
    lazy = false,
    cmd = require("plugins.eskk-vim.cmds"),
    keys = keys,
    config = function()
        require("plugins.eskk-vim.variables")
        -- User Commands
        require("plugins.eskk-vim.usercmds").create()
    end,
    cond = cond,
    enabled = cond,
}

return spec
