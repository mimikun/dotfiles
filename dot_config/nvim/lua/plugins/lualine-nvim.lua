---@type table
local disabled_filetypes = {
    statusline = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
    winbar = { "NvimTree", "alpha", "gitrebase", "gitcommit" },
}

---@type table
local options = {
    theme = "auto",
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = disabled_filetypes,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
}

---@type table
local opts = {
    options = options,
    sections = require("plugins.configs.lualine-nvim.sections"),
    tabline = {},
    winbar = {},
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "SmiteshP/nvim-navic",
}

---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = "BufEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
