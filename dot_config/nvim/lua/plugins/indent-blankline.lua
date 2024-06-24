-- TODO: settings

---@type table
local cmds = {
    "IBLEnable",
    "IBLDisable",
    "IBLToggle",
    "IBLEnableScope",
    "IBLDisableScope",
    "IBLToggleScope",
}

---@type LazySpec
local spec = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    cmd = cmds,
    event = "VimEnter",
    opts = {
        exclude = {
            filetypes = {
                "help",
                "startify",
                "alpha",
                "dashboard",
                "NvimTree",
                "Trouble",
                "TelescopePrompt",
            },
        },
    },
    --cond = false,
}

return spec
