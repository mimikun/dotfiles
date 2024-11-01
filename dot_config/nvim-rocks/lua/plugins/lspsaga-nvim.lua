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

require("lspsaga").setup(opts)
