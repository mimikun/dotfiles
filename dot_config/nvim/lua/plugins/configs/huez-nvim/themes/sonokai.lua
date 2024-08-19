-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("sonokai setting")

    vim.g.sonokai_style = "default"
    --vim.g.sonokai_style = "atlantis"
    --vim.g.sonokai_style = "andromeda"
    --vim.g.sonokai_style = "shusia"
    --vim.g.sonokai_style = "maia"
    --vim.g.sonokai_style = "espresso"
    vim.g.sonokai_transparent_background = vim.g.transparent_enabled and 1 or 0
    vim.g.sonokai_current_word = vim.g.transparent_enabled and "bold" or "grey background"
    -- if you want more ui components to be transparent
    --vim.g.sonokai_transparent_background = 2
    -- when not in transparent mode,
    --vim.g.sonokai_current_word = "grey background"
    -- when in transparent mode.
    --vim.g.sonokai_current_word = "bold"
    --vim.g.sonokai_current_word = "underline"
    --vim.g.sonokai_current_word = "italic"
    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_disable_italic_comment = 0
    vim.g.sonokai_enable_italic = 0
    vim.g.sonokai_cursor = "auto"
    --vim.g.sonokai_cursor = "red"
    --vim.g.sonokai_cursor = "orange"
    --vim.g.sonokai_cursor = "yellow"
    --vim.g.sonokai_cursor = "green"
    --vim.g.sonokai_cursor = "blue"
    --vim.g.sonokai_cursor = "purple"
    vim.g.sonokai_dim_inactive_windows = 0
    vim.g.sonokai_menu_selection_background = "blue"
    --vim.g.sonokai_menu_selection_background = "green"
    --vim.g.sonokai_menu_selection_background = "red"
    vim.g.sonokai_spell_foreground = "none"
    --vim.g.sonokai_spell_foreground = "colored"
    vim.g.sonokai_show_eob = 1
    vim.g.sonokai_float_style = "bright"
    --vim.g.sonokai_float_style = "dim"
    vim.g.sonokai_diagnostic_text_highlight = 0
    vim.g.sonokai_diagnostic_line_highlight = 0
    vim.g.sonokai_diagnostic_virtual_text = "grey"
    --vim.g.sonokai_diagnostic_virtual_text = "colored"
    --vim.g.sonokai_diagnostic_virtual_text = "highlighted"
    vim.g.sonokai_disable_terminal_colors = 0
    vim.g.sonokai_lightline_disable_bold = 0
    vim.g.sonokai_better_performance = 0
    --vim.g.sonokai_colors_override = {}

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
