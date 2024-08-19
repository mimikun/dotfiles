---@type table
local cmds = {
    "SatelliteEnable",
    "SatelliteDisable",
    "SatelliteRefresh",
}

---@type LazySpec[]
local dependencies = {
    "lewis6991/gitsigns.nvim",
}

---@type table
local opts = {
    excluded_filetypes = {
        "cmp_docs",
        "cmp_menu",
        "noice",
        "prompt",
        "TelescopePrompt",
        "alpha",
    },
    handlers = {
        cursor = {
            symbols = { "⎺", "⎻", "⎼", "⎽" },
        },
        diagnostic = {
            signs = { "-", "=", "≡" },
        },
        gitsigns = {
            signs = {
                add = "│",
                change = "│",
                delete = "-",
            },
        },
        quickfix = {
            signs = { "-", "=", "≡" },
        },
    },
}

---@type LazySpec
local spec = {
    "lewis6991/satellite.nvim",
    --lazy = false,
    cmd = cmds,
    event = "VimEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    -- NOTE: scrollbar plugin
    --enabled = false,
}

return spec
