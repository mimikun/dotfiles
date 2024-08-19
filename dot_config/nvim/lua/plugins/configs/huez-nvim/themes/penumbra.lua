-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("penumbra.nvim setting")

    ---@type table
    local opts = {
        italic_comment = false,
        transparent_bg = vim.g.transparent_enabled,
        show_end_of_buffer = false,
        light = false,
        contrast = nil,
        --contrast = "plus",
        --contrast = "plusplus",
    }

    require("penumbra").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
