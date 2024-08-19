-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("kanagawa-paper.nvim setting")

    ---@type KanagawaConfig
    local opts = {
        transparent = vim.g.transparent_enabled,
        gutter = false,
        -- disabled when transparent
        dimInactive = true,
        functionStyle = { italic = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = false },
    }

    require("kanagawa-paper").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
