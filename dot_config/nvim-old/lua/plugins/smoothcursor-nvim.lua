---@type LazySpec
local spec = {
    "gen740/SmoothCursor.nvim",
    --lazy = false,
    event = "BufRead",
    config = function()
        local smoothcursor = require("smoothcursor")
        smoothcursor.setup({
            -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".
            type = "default",
            -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
            cursor = "",
            -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
            texthl = "SmoothCursor",
            -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.
            linehl = nil,

            fancy = {
                -- enable fancy mode
                enable = false,
                -- false to disable fancy head
                head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
                body = {
                    { cursor = "󰝥", texthl = "SmoothCursorRed" },
                    { cursor = "󰝥", texthl = "SmoothCursorOrange" },
                    { cursor = "●", texthl = "SmoothCursorYellow" },
                    { cursor = "●", texthl = "SmoothCursorGreen" },
                    { cursor = "•", texthl = "SmoothCursorAqua" },
                    { cursor = ".", texthl = "SmoothCursorBlue" },
                    { cursor = ".", texthl = "SmoothCursorPurple" },
                },
                -- false to disable fancy tail
                tail = { cursor = nil, texthl = "SmoothCursor" },
            },

            -- Loaded when 'type' is set to "matrix"
            matrix = {
                head = {
                    -- Picks a random character from this list for the cursor text
                    cursor = require("smoothcursor.matrix_chars"),
                    -- Picks a random highlight from this list for the cursor text
                    texthl = {
                        "SmoothCursor",
                    },
                    -- No line highlight for the head
                    linehl = nil,
                },
                body = {
                    -- Specifies the length of the cursor body
                    length = 6,
                    -- Picks a random character from this list for the cursor body text
                    cursor = require("smoothcursor.matrix_chars"),
                    -- Picks a random highlight from this list for each segment of the cursor body
                    texthl = {
                        "SmoothCursorGreen",
                    },
                },
                tail = {
                    -- Picks a random character from this list for the cursor tail (if any)
                    cursor = nil,
                    -- Picks a random highlight from this list for the cursor tail
                    texthl = {
                        "SmoothCursor",
                    },
                },
                -- Determines if the cursor should stop or not (false means it will stop)
                unstop = false,
            },

            -- Automatically start SmoothCursor
            autostart = true,
            -- Redraw the screen on each update
            always_redraw = true,
            -- Choose "bottom" or "top" for flying effect
            flyin_effect = nil,
            -- Max speed is 100 to stick with your current position
            speed = 25,
            -- Update intervals in milliseconds
            intervals = 35,
            -- Set marker priority
            priority = 10,
            -- Timeout for animations in milliseconds
            timeout = 3000,
            -- Animate only if cursor moves more than this many lines
            threshold = 3,
            -- Disable in floating windows
            disable_float_win = false,
            -- Enable only for specific file types, e.g., { "lua", "vim" }
            enabled_filetypes = nil,
            -- Disable for these file types, ignored if enabled_filetypes is set.
            -- e.g., { "TelescopePrompt", "NvimTree" }
            disabled_filetypes = nil,
        })
    end,
    --cond = false,
}

return spec
