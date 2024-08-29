---@type table
local cmds = {
    "EskkMap",
    "EskkUnmap",
    "EskkForgetRegisteredWords",
    "EskkUpdateDictionary",
    "EskkFixDictionary",
    "EskkReload",
    "EskkEnable",
    "EskkDisable",
    "EskkToggle",
}

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
    cmd = cmds,
    keys = keys,
    config = function()
        require("plugins.configs.eskk-vim.variables")

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

        -- User Events
        --[[ TODO:
        I want User Events like lazy.nvim.
        Why: paleovim style is difficult.
        e.g.
        EskkEnable - |eskk-enable-post|
        EskkEnablePre - |eskk-enable-pre|
        EskkDisable - |eskk-disable-post|
        EskkDisablePre - |eskk-disable-pre|
        ]]
    end,
    --cond = false,
}

return spec
