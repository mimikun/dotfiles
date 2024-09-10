-- TODO: config
-- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#telescope
-- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#lualine

---@type table
local cmds = {
    "AerialToggle",
    "AerialOpen",
    "AerialOpenAll",
    "AerialClose",
    "AerialCloseAll",
    "AerialNext",
    "AerialPrev",
    "AerialGo",
    "AerialInfo",
    "AerialNavToggle",
    "AerialNavOpen",
    "AerialNavClose",
}

---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    lazy_load = true,

    -- Customize the characters used when show_guides = true
    guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = "  ",
    },
}

---@type LazySpec
local spec = {
    "stevearc/aerial.nvim",
    --lazy = false,
    cmd = cmds,
    --event = "VeryLazy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
