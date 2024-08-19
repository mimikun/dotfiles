local M = {

    -- barbar-nvim.lua
    --[[
    exclude_ft = {},
    ]]

    -- hardtime-nvim.lua
    --[[
    disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
    },
    ]]

    -- indent-blankline.lua
    --[[
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "startify",
            "alpha",
            "dashboard",
            "NvimTree",
            "Trouble",
        },
    ]]

    -- lualine-nvim.lua
    --[[
    local disabled_filetypes = {
        statusline = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
        winbar = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
    }
    ]]

    -- marks.lua
    --[[
        excluded_filetypes = {},
    ]]

    -- moody-nvim.lua
    --[[
        disabled_filetypes = { "TelescopePrompt", "lazy" },
    ]]

    -- satellite-nvim.lua
    --[[
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
    },
    ]]

    -- screenkey-nvim.lua
    --[[
        filetypes = { "toggleterm" },
    ]]

    -- smoothcursor-nvim.lua
    --[[
    disabled_filetypes = {
        "TelescopePrompt",
        "NvimTree",
    },
    ]]

    -- todo-comments-nvim.lua
    --[[
        exclude = {},
    ]]

    -- vim-illuminate.lua
    --[[
    filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
    },
    ]]
}

return M
