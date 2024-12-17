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

return opts
