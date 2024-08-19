---@type table
local opts = {
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
        },
        buftypes = {
            "terminal",
            "nofile",
            "quickfix",
            "prompt",
        },
    },
}

---@type LazySpec
local spec = {
    "lukas-reineke/virt-column.nvim",
    --lazy = false,
    event = "BufEnter",
    opts = opts,
    --cond = false,
    -- NOTE: colorcolumn plugin
    --enabled = false,
}

return spec
