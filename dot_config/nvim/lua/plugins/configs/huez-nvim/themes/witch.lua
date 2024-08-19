-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "witch-dark",
        "witch-light",
    },
}

function M.set_theme(theme)
    print("witch.nvim setting")

    ---@type table
    local opts = {
        -- NOTE: Not support "transparent = true"
    }

    require("witch").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
