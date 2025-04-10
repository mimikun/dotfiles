---@type table
local opts = {
    activate = true, -- Activate the plugin?
    -- You can toggle this with `AutoInputSwitch on|off` command at any time.

    async = false, -- Run `cmd_get` & `cmd_set` asynchronously?
    -- false: Runs synchronously. (Recommended)
    --        You may encounter subtle lags if you switch between Insert-mode and Normal-mode very rapidly.
    --  true: Runs asynchronously.
    --        No lags, but less reliable than synchronous.

    prefix = "AutoInputSwitch", -- Prefix of the command names

    popup = {
        -- When the plugin changed the input source, it can indicate the language of the current input source with a popup.

        enable = true, -- Show popups?
        duration = 1500, -- How long does a popup remain visible? (ms)
        pad = true, -- Whether to add leading & trailing spaces
        hl_group = "PmenuSel", -- Highlight group

        -- Popup window settings (:h nvim_open_win())
        border = "none", -- Style of the window border
        zindex = 50, -- Rendering priority
        row = 1, -- Horizontal offset
        col = 0, -- Vertical offset
        relative = "cursor", -- The offsets are relative to: editor/win/cursor/mouse
        anchor = "NW", -- Which corner is a popup window aligned to?
        -- 'NW' : Northwest
        -- 'NE' : Northeast
        -- 'SW' : Southwest
        -- 'SE' : Southeast
    },

    normalize = {
        -- Outside of Insert-mode, the plugin can force your input source to be the latin one.
        -- We call this feature "Normalize".

        enable = true, -- Enable Normalize?
        on = { -- Events to trigger Normalize (:h events)
            "InsertLeave",
            "BufLeave",
            "WinLeave",
            "FocusLost",
            "ExitPre",
        },
        file_pattern = nil, -- File pattern to enable Normalize (nil to any file)
        -- Example:
        -- file_pattern = { '*.md', '*.txt' },

        popup = "ABC", -- Popup text to show when normalize (nil to disable)
    },

    restore = {
        enable = true,
        on = {
            "InsertEnter",
            "FocusGained",
        },
        file_pattern = nil, -- File pattern to enable Restore (nil to any file)
        -- Example:
        -- file_pattern = { '*.md', '*.txt' },

        exclude_pattern = "[-a-zA-Z0-9=~+/?!@#$%%^&_(){}%[%];:<>]",
        -- When you switch to Insert-mode, the plugin checks the cursor position at the moment.
        -- And if any of the characters before & after the position match with `exclude_pattern`,
        -- the plugin cancel to restore the input source and leave it as it is.
        -- The default value of `exclude_pattern` is alphanumeric characters with a few exceptions.
        -- Set nil to disable this feature.
    },

    match = {
        -- When you enter Insert-mode, the plugin can detect the language of the characters adjacent to the cursor at the moment.
        -- Then, it can automatically switch the input source to the one that matches the detected language.
        -- We call this feature "Match".
        -- If you enable this feature, we recommend to set `restore.enable` to false.
        -- This feature is disabled by default.

        enable = true,
        on = { -- Events to trigger Match (:h events)
            "InsertEnter",
            "FocusGained",
        },
        file_pattern = nil, -- File pattern to enable Match (nil to any file)
        -- Example:
        -- file_pattern = { '*.md', '*.txt' },

        languages = {
            -- Languages to match with the characters. Set `enable` to true for the ones you want to use.
            -- `pattern` must be a valid regex string. Use the unicode ranges corresponding to the language.
            -- You can also add your own languages.
            -- If you do, do not forget to add the input sources for them as well, to `os_settings[Your OS].lang_inputs`.
            Ru = { enable = false, priority = 0, pattern = "[\\u0400-\\u04ff]" },
            Ja = { enable = true, priority = 0, pattern = "[\\u3000-\\u30ff\\uff00-\\uffef\\u4e00-\\u9fff]" },
            Zh = {
                enable = false,
                priority = 0,
                pattern = "[\\u3000-\\u303f\\u4e00-\\u9fff\\u3400-\\u4dbf\\u3100-\\u312f]",
            },
            Ko = {
                enable = false,
                priority = 0,
                pattern = "[\\u3000-\\u303f\\u1100-\\u11ff\\u3130-\\u318f\\uac00-\\ud7af]",
            },
        },

        lines = {
            -- If the current line is empty or has only whitespace characters,
            -- the plugin can also checks the lines above/below the current line that if they have any characters match `languages`.
            above = 2, -- How meany lines above the current line to check
            below = 1, -- How meany lines below the current line to check
        },
    },
    os_settings = { -- OS-specific settings
        macos = {
            enable = true,
            cmd_get = "im-select", -- Command to get the current input source
            cmd_set = "im-select %s", -- Command to set the input source (Use `%s` as a placeholder for the input source)
            normal_input = nil, -- Name of the input source for Normalize (Set nil to auto-detect)
            -- Examples:
            -- normal_input = 'com.apple.keylayout.ABC',
            -- normal_input = 'com.apple.keylayout.US',
            -- normal_input = 'com.apple.keylayout.USExtended',

            -- You can also use a table like this:
            -- normal_input = { 'com.apple.keylayout.ABC', 'eisu' },
            --   The 1st string is the name of the input source, which should match with the output of `cmd_get`.
            --   The 2nd string is what is actually passed to `cmd_set`.

            lang_inputs = {
                -- The input sources corresponding to `match.languages` for each.
                -- You can also use a table for each entry just like `normal_input`.
                Ru = "com.apple.keylayout.Russian",
                Ja = "com.apple.inputmethod.Kotoeri.Japanese",
                Zh = "com.apple.inputmethod.SCIM.ITABC",
                Ko = "com.apple.inputmethod.Korean.2SetKorean",
            },
        },
        windows = {
            enable = true,
            cmd_get = "im-select.exe",
            cmd_set = "im-select.exe %s",
            normal_input = nil,
            lang_inputs = {},
        },
        linux = {
            enable = true,
            cmd_get = "ibus engine",
            cmd_set = "ibus engine %s",
            normal_input = nil,
            lang_inputs = {},
        },
    },
}

return opts
