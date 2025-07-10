---@type table
local opts = {
    -- Key mappings.
    -- Set any mapping to empty string to disable it.
    keymaps = {
        -- Decode Base64 in-place (normal mode)
        decode_base64_inplace = "gyb",

        -- Decode Base64 in-place (visual mode)
        vdecode_base64_inplace = "gyb",

        -- Decode Base64 in a popup (normal mode)
        decode_base64_popup = "gb",

        -- Decode Base64 in a popup (visual mode)
        vdecode_base64_popup = "gb",

        -- Encode Base64 in-place (normal mode)
        encode_base64_inplace = "gB",

        -- Encode Base64 in-place (visual mode)
        vencode_base64_inplace = "gB",

        -- Decode Base64URL in-place (normal mode)
        decode_base64url_inplace = "gys",

        -- Decode Base64URL in-place (visual mode)
        vdecode_base64url_inplace = "gys",

        -- Decode Base64URL in a popup (normal mode)
        decode_base64url_popup = "gs",

        -- Decode Base64URL in a popup (visual mode)
        vdecode_base64url_popup = "gs",

        -- Encode Base64URL in-place (normal mode)
        encode_base64url_inplace = "gS",

        -- Encode Base64URL in-place (visual mode)
        vencode_base64url_inplace = "gS",

        -- Decode URL in-place (normal mode)
        decode_url_inplace = "gyl",

        -- Decode URL in-place (visual mode)
        vdecode_url_inplace = "gyl",

        -- Decode URL in a popup (normal mode)
        decode_url_popup = "gl",

        -- Decode URL in a popup (visual mode)
        vdecode_url_popup = "gl",

        -- Encode URL in-place (normal mode)
        encode_url_inplace = "gL",

        -- Encode URL in-place (visual mode)
        vencode_url_inplace = "gL",
    },

    -- Popup window settings
    popup = {
        -- Whether to enter popup window on open or no
        enter = true,

        -- Whether to show window title (with encoding type) or not
        show_title = true,

        -- Border style, as specified in 'nvim_open_win'.
        -- Normally, one of: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'
        border = "rounded",

        -- Pseudo-transparency (see 'winblend').
        -- Set to 0 to disable.
        transparency = 10,

        --- Popup window width limits
        width = { min = 10, max = 80 },

        --- Popup window height limits
        height = { min = 1, max = 50 },

        --- Keys to close the popup window. Any key from the lists closes it.
        close_on = { "<Esc>", "q" },
    },
}

return opts
