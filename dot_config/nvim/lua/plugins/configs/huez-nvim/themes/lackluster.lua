-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "lackluster",
        "lackluster-hack",
        "lackluster-mint",
        "lackluster-night",
        "lackluster-dark",
    },
}

function M.set_theme(theme)
    print("lackluster.nvim setting")

    --- @type LacklusterConfig
    local opts = {
        -- NOTE: Not support "transparent = true"
        tweak_ui = {
            disable_undercurl = false,
            enable_end_of_buffer = false,
        },
        tweak_background = {
            -- 'default' is default
            -- 'none' is transparent
            -- main background
            normal = "none",
            -- nvim_cmp, wildmenu ...
            menu = "none",
            -- lazy, mason, whichkey ...
            popup = "none",
            -- telescope
            telescope = "none",
        },
    }

    require("lackluster").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
