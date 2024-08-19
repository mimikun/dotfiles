-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("fluoromachine.nvim setting")

    ---@type fm.config
    local opts = {
        theme = "fluoromachine",
        --theme = "retrowave",
        --theme = "delta",
        brightness = 0.05,
        glow = false,
        transparent = vim.g.transparent_enabled,
    }

    require("fluoromachine").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
