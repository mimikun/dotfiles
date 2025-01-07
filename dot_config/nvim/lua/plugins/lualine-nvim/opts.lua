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
    sections = require("plugins.lualine-nvim.sections"),
    tabline = {},
    winbar = {},
}

return opts
