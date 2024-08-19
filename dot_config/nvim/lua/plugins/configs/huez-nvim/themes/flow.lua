-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("flow.nvim setting")

    ---@class FlowConfig
    local opts = {
        transparent = vim.g.transparent_enabled,
        fluo_color = "pink",
        --fluo_color = "yellow",
        --fluo_color = "orange",
        --fluo_color = "green",
        mode = "normal",
        --mode = "bright",
        --mode = "desaturate",
        --mode = "dark",
        aggressive_spell = false,
    }

    require("flow").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
