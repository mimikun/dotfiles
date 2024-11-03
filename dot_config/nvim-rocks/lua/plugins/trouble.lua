---@type trouble.Config
local opts = {
    -- stylua: ignore
    icons = {
        ---@type trouble.Indent.symbols
        indent        = {
            top         = "│ ",
            middle      = "├╴",
            last        = "└╴",
            -- last          = "-╴",
            -- last       = "╰╴", -- rounded
            fold_open   = " ",
            fold_closed = " ",
            ws          = "  ",
        },
        folder_closed = " ",
        folder_open   = " ",
        kinds         = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TypeParameter = " ",
            Variable      = "󰀫 ",
        },
    },
}

require("trouble").setup(opts)

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {})
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {})
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", {})
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", {})
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", {})
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", {})
