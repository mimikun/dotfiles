---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
}

---@type wk.Opts
local opts = {
    preset = "modern",
    keys = {
        -- binding to scroll down inside the popup
        scroll_down = "<c-d>",
        -- binding to scroll up inside the popup
        scroll_up = "<c-u>",
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
        keys = {
            Up = " ",
            Down = " ",
            Left = " ",
            Right = " ",
            C = "󰘴 ",
            M = "󰘵 ",
            D = "󰘳 ",
            S = "󰘶 ",
            CR = "󰌑 ",
            Esc = "󱊷 ",
            ScrollWheelDown = "󱕐 ",
            ScrollWheelUp = "󱕑 ",
            NL = "󰌑 ",
            BS = "󰁮",
            Space = "󱁐 ",
            Tab = "󰌒 ",
            F1 = "󱊫",
            F2 = "󱊬",
            F3 = "󱊭",
            F4 = "󱊮",
            F5 = "󱊯",
            F6 = "󱊰",
            F7 = "󱊱",
            F8 = "󱊲",
            F9 = "󱊳",
            F10 = "󱊴",
            F11 = "󱊵",
            F12 = "󱊶",
        },
    },
    disable = {
        -- disable WhichKey for certain file types
        ft = {},
        -- disable WhichKey for certain buffer types
        bt = {},
    },
}

---@type LazySpec
local spec = {
    "folke/which-key.nvim",
    --lazy = false,
    cmd = "WhichKey",
    keys = keys,
    event = "VeryLazy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
