---@type table
local opts = {
    extension_mappings = {},
    options = {
        dirs_first = true,
        show_hidden = false,
        collapse_dirs = true,
        line_numbers = {
            enabled = true,
            relative = false,
        },
        file_icons = {
            enabled = true,
            directory_icon = "",
            fallback_file_icon = "",
        },
        responsive_column_widths = {
            -- Keys are breakpoints, values are column widths
            -- A breakpoint means "when vim.o.columns >= x, use these column widths"
            -- Columns widths must add up to 1 after rounding to 2 decimal places
            -- Parent or child windows can be hidden by setting a width of 0
            ["0"] = { 0, 0.5, 0.5 },
            ["120"] = { 0.2, 0.3, 0.5 },
            ["200"] = { 0.25, 0.25, 0.5 },
        },
        backdrop = 60, -- Backdrop opacity. 0 is fully opaque, 100 is fully transparent (disables the feature)
        transparency = 0, -- 0 is fully opaque, 100 is fully transparent
        border = "single", -- See :h nvim_open_win for border options
        max_height = 45,
        max_width = 220,
        margin_x = 4, -- Space left and right
        margin_y = 4, -- Space above and below
    },
    git_signs = {
        enabled = true,
        signs = {
            -- The value can be either a string or a table.
            -- If a string, will be basic text. If a table, will be passed as the {dict} argument to vim.fn.sign_define
            -- If you want to add color, you can specify a highlight group in the table.
            add = "+",
            modify = "~",
            rename = "r",
            untracked = "?",
        },
    },
    diagnostic_signs = {
        enabled = true,
    },
}

return opts
