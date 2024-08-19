---@type table
local cmds = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
}

---@type table
local opts = {
    indent = {
        char = "▎",
        --[[
        Default: `▎` ~
        Alternatives: ~
          • left aligned solid
            • `▏`
            • `▎` (default)
            • `▍`
            • `▌`
            • `▋`
            • `▊`
            • `▉`
            • `█`
          • center aligned solid
            • `│`
            • `┃`
          • right aligned solid
            • `▕`
            • `▐`
          • center aligned dashed
            • `╎`
            • `╏`
            • `┆`
            • `┇`
            • `┊`
            • `┋`
          • center aligned double
            • `║`
        ]]
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

---@type LazySpec
local spec = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    opts = opts,
    --cond = false,
}

return spec
