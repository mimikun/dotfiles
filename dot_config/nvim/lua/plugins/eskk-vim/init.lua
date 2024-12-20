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
        -- Enable eskk
        vim.api.nvim_create_user_command("EskkEnable", function()
            vim.fn["eskk#enable"]()
        end, {})
        -- Disable eskk
        vim.api.nvim_create_user_command("EskkDisable", function()
            vim.fn["eskk#disable"]()
        end, {})
        -- Toggle eskk
        vim.api.nvim_create_user_command("EskkToggle", function()
            vim.fn["eskk#toggle"]()
        end, {})
    end,
    cond = cond,
    enabled = cond,
}

return spec
