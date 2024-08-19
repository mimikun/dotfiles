-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "pro",
        "octagon",
        "machine",
        "ristretto",
        "spectrum",
        "classic",
    },
}

function M.set_theme(theme)
    print("monokai-pro.nvim setting")

    ---@type MonokaiProOptions
    local opts = {
        transparent_background = vim.g.transparent_enabled,
    }

    require("monokai-pro").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
