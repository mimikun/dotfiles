-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("edge setting")

    vim.g.edge_style = "default"
    --vim.g.edge_style = "aura"
    --vim.g.edge_style = "neon"
    vim.g.edge_transparent_background = vim.g.transparent_enabled and 1 or 0
    vim.g.edge_current_word = vim.g.transparent_enabled and "bold" or "grey background"
    -- if you want more ui components to be transparent
    --vim.g.edge_transparent_background = 2
    vim.g.edge_better_performance = 1
    vim.g.edge_dim_foreground = 0
    vim.g.edge_disable_italic_comment = 0
    vim.g.edge_enable_italic = 0
    vim.g.edge_cursor = "auto"
    --vim.g.edge_cursor = "red"
    --vim.g.edge_cursor = "yellow"
    --vim.g.edge_cursor = "green"
    --vim.g.edge_cursor = "cyan"
    --vim.g.edge_cursor = "blue"
    --vim.g.edge_cursor = "purple"
    vim.g.edge_dim_inactive_windows = 0
    vim.g.edge_menu_selection_background = "blue"
    --vim.g.edge_menu_selection_background = "green"
    --vim.g.edge_menu_selection_background = "purple"
    vim.g.edge_spell_foreground = "none"
    vim.g.edge_spell_foreground = "colored"
    vim.g.edge_show_eob = 1
    vim.g.edge_float_style = "bright"
    --vim.g.edge_float_style = "dim"
    vim.g.edge_diagnostic_text_highlight = 0
    vim.g.edge_diagnostic_line_highlight = 0
    vim.g.edge_diagnostic_virtual_text = "grey"
    --vim.g.edge_diagnostic_virtual_text = "colored"
    --vim.g.edge_diagnostic_virtual_text = "highlighted"
    -- when not in transparent mode
    --vim.g.edge_current_word = "grey background"
    -- when in transparent mode
    --vim.g.edge_current_word = "bold"
    --vim.g.edge_current_word = "underline"
    --vim.g.edge_current_word = "italic"
    vim.g.edge_disable_terminal_colors = 0
    vim.g.edge_lightline_disable_bold = 0
    vim.g.edge_better_performance = 0
    --vim.g.edge_colors_override = {}

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
