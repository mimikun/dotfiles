---@type table
local opts = {
    indent = {
        char = "▎",
    },
    exclude = {
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
        buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
        },
    },
}

return opts
