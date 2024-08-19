---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    -- https://nvimdev.github.io/lspsaga/codeaction/
    code_action = {
        show_server_name = true,
        --extend_gitsigns = false,
    },
    -- https://nvimdev.github.io/lspsaga/breadcrumbs/
    symbol_in_winbar = {
        separator = " › ",
    },
    -- https://nvimdev.github.io/lspsaga/misc/
    ui = {
        expand = "⊞",
        collapse = "⊟",
        code_action = "💡",
        actionfix = " ",
        imp_sign = "󰳛 ",
    },
}

---@type LazySpec
local spec = {
    "nvimdev/lspsaga.nvim",
    --lazy = false,
    cmd = "Lspsaga",
    event = "LspAttach",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
