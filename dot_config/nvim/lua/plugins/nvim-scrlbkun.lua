-- nvim-scrollbar alternative plugins
return {
    "kensyo/nvim-scrlbkun",
    lazy = false,
    --event = "VeryLazy",
    opts = {
        -- If you want to display scrollbars on multiple windows, set to false.
        -- If set to true, a display area comes out only on the current window.
        single_window = true,

        -- zindex of display areas.
        zindex = 10,

        -- winblend of display areas.
        winblend = 40,

        -- On these filetypes, scrollbars don't come out.
        excluded_filetypes = { "NvimTree" },

        -- On these buftypes, scrollbars don't come out.
        excluded_buftypes = { "prompt" },

        -- Time until a display area is hidden. Specify in milliseconds.
        -- If set to 0, a display area isn't hidden over time.
        fadeout_time = 2000,

        -- The number of columns for display areas of components
        width = 3,

        -- bar component
        bar = {
            -- If set to true, the bar component is enabled.
            enable = true,

            -- The component is drawn at these events.
            -- The specification {event_name, patterns} can also be used.
            -- For example { "CmdlineLeave", {"/", "\\?", ":"} } is ok.
            draw_events = { "WinScrolled", "BufEnter", "FocusGained" },

            -- The component is drawn on all the windows in the current tabpage
            -- at these events. But if single_window is set to true, draw_events_tab
            -- is treated exactly the same as draw_events.
            -- As with draw_events, the specification {event_name, patterns}
            -- can also be used.
            draw_events_tab = { "VimResized", "TabEnter" },

            -- When components overlap, the one with the higher priority is drawn.
            -- Specify by positive integer.
            priority = 100,

            -- What number, counting from the left, of the columns allocated
            -- by the `width` field should be used to display the component.
            -- Specify in an array between 1 and `width`.
            draw_columns = { 1, 2, 3 },

            -- A sign for a scrollbar. It is recommended not to change it from
            -- the default empty symbol.
            sign = " ",
        },

        -- cursor component
        cursor = {
            -- The same as those of the bar component
            enable = true,
            draw_events = { "BufEnter", "FocusGained", "CursorMoved" },
            draw_events_tab = { "VimResized", "TabEnter" },
            priority = 200,
            draw_columns = { 1, 2, 3 },

            -- Signs for a cursor. Specify in array. If you specify an array of n-elements,
            -- then the sign to be used is determined in n more levels depending on the
            -- cursor position.
            signs = {
                "▔",
                "━",
                "▁",
            },

            -- How to determin the sign to be used. "skip_first" or "normal"
            sign_arrangement = "skip_first",
        },

        -- search component
        search = {
            -- The same as those of the bar component
            enable = true,
            draw_events = {},
            draw_events_tab = {
                "TextChanged",
                "TextChangedI",
                "TextChangedP",
                "TabEnter",
                {
                    "CmdlineLeave",
                    { "/", "\\?", ":" },
                },
                {
                    "CmdlineChanged",
                    { "/", "\\?" },
                },
            },
            priority = 500,
            draw_columns = { 1 },

            -- Signs for search results.
            -- If you specify an array of n-elements,
            -- then the sign to be used is determined in n more levels depending
            -- on the number of matched terms
            signs = {
                ".",
                ":",
            },

            -- If set to true, the 'signs' field is ignored and the plugin uses
            -- symbols and an algorithm that allow for just a little more detailed
            -- drawing.
            use_built_in_signs = true,
        },

        -- diagnostics component
        diagnostics = {
            -- The same as those of the bar component
            enable = true,
            draw_events = {},
            draw_events_tab = { "BufEnter", "DiagnosticChanged", "TabEnter" },
            priority = 400,
            draw_columns = { 2 },

            -- Signs for diagnostics.
            signs = {
                -- If you specify an array of n-elements,
                -- then the sign to be used is determined in n more levels depending
                -- on the number of errors {warns, infos, hints}.
                ERROR = { ".", ":" },
                WARN = { ".", ":" },
                INFO = { ".", ":" },
                HINT = { ".", ":" },
            },

            -- The same as that of the search component
            use_built_in_signs = true,
        },

        -- githunks component
        githunks = {
            -- The same as those of the bar component
            enable = true,
            draw_events = {},
            draw_events_tab = {
                {
                    "User",
                    "GitSignsUpdate",
                },
            },
            priority = 300,
            draw_columns = { 3 },

            -- Signs for githunks.
            signs = {
                -- If you specify an array of n-elements,
                -- then the sign to be used is determined in n more levels depending
                -- on add {delete, change}-hunks length
                add = { "│" },
                delete = { "▸" },
                change = { "│" },
            },

            -- The same as that of the search component
            use_built_in_signs = true,
        },
    },
    cond = false,
}
