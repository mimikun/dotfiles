---@type table
local opts = {
    sidebar = {
        hide_cursor = true,
        open_direction = "try-left",
        on_open_make_windows_equal = true,
        cursor_follow = true,
        auto_resize = {
            enabled = true,
            min_width = 20,
            max_width = 40,
        },
        fixed_width = 30,
        symbol_filter = function(filetype, symbol)
            return true
        end,
        show_inline_details = false,
        show_details_pop_up = false,
        auto_peek = false,
        unfold_on_goto = false,
        close_on_goto = false,
        wrap = false,
        show_guide_lines = true,
        chars = {
            folded = "",
            unfolded = "",
            guide_vert = "│",
            guide_middle_item = "├",
            guide_last_item = "└",
        },
        preview = {
            show_always = false,
            show_line_number = false,
            auto_size = true,
            auto_size_extra_lines = 6,
            min_window_height = 7,
            max_window_height = 30,
            fixed_size_height = 12,
            window_width = 100,
            keymaps = {
                ["q"] = "close",
            },
        },
        keymaps = {
            ["<CR>"] = "goto-symbol",
            ["<RightMouse>"] = "peek-symbol",
            ["o"] = "peek-symbol",
            ["K"] = "open-preview",
            ["d"] = "open-details-window",
            ["gs"] = "show-symbol-under-cursor",
            ["gp"] = "goto-parent",
            ["[["] = "prev-symbol-at-level",
            ["]]"] = "next-symbol-at-level",
            ["l"] = "unfold",
            ["zo"] = "unfold",
            ["L"] = "unfold-recursively",
            ["zO"] = "unfold-recursively",
            ["zr"] = "unfold-one-level",
            ["zR"] = "unfold-all",
            ["h"] = "fold",
            ["zc"] = "fold",
            ["H"] = "fold-recursively",
            ["zC"] = "fold-recursively",
            ["zm"] = "fold-one-level",
            ["zM"] = "fold-all",
            ["s"] = "search",
            ["td"] = "toggle-inline-details",
            ["tD"] = "toggle-auto-details-window",
            ["tp"] = "toggle-auto-preview",
            ["tch"] = "toggle-cursor-hiding",
            ["tcf"] = "toggle-cursor-follow",
            ["tf"] = "toggle-filters",
            ["to"] = "toggle-auto-peek",
            ["tg"] = "toggle-close-on-goto",
            ["t="] = "toggle-auto-resize",
            ["t["] = "decrease-max-width",
            ["t]"] = "increase-max-width",
            ["<2-LeftMouse>"] = "toggle-fold",
            ["q"] = "close",
            ["?"] = "help",
            ["g?"] = "help",
        },
    },
}

return opts
