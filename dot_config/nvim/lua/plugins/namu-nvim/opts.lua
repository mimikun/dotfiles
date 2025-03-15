---@type table
local opts_namu_symbols = {
    enable = true,
    ---@type NamuConfig
    options = {
        row_position = "top10", -- options: "center"|"top10"|"top10_right"|"center_right"|"bottom",
        focus_current_symbol = true,
        auto_select = false,
        initially_hidden = false,
        multiselect = {
            enabled = true,
            max_items = nil, -- No limit by default
        },
        actions = {
            close_on_yank = false,
            close_on_delete = true,
        },
        -- 󱠦 -  -  -- 󰚟
        icon = "󱠦",
    },
}

---@type table
local opts_colorscheme = {
    enable = false,
    options = {
        -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
        -- very efficient mechanism to Remember selected colorscheme
        persist = true,
        -- If you open multiple nvim instances, then probably you need to enable this
        write_shada = false,
        -- exclude any colorscheme from the list
        excluded_schemes = {},
        -- it accept the same row_position and movement keys as the one in namy symbols
    },
}

---@type table
local opts = {
    namu_symbols = opts_namu_symbols,
    colorscheme = opts_colorscheme,
}

return opts
