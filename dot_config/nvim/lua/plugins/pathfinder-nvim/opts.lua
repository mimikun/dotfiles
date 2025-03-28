---@type table
local opts = {
    -- Search behaviour
    forward_limit = -1, -- Search the entire visible buffer
    scan_unenclosed_words = true, -- Include plain-text (non-delimited) file paths
    open_mode = "edit", -- Open files in the current buffer (:edit), accepts string or function
    gF_count_behaviour = "nextfile", -- [count]gF will open the next file at line `count`

    -- File resolution settings
    associated_filetypes = {}, -- File extensions that should be tried (also see `suffixesadd`)
    enclosure_pairs = { -- Define all file path delimiters to search between
        ["("] = ")",
        ["{"] = "}",
        ["["] = "]",
        ["<"] = ">",
        ['"'] = '"',
        ["'"] = "'",
        ["`"] = "`",
    },
    includeexpr = "", -- Helper function to set `includeexpr`
    ft_overrides = { -- Filetype-specific settings
        lua = {
            associated_filetypes = { ".lua", ".tl" },
            enclosure_pairs = {
                ["'"] = "'",
                ['"'] = '"',
                ["[["] = "]]",
            },
            includeexpr = "substitute(v:fname,'\\.\\w*','','')",
        },
    },

    -- User interaction
    offer_multiple_options = true, -- If multiple valid files with the same name are found, prompt for action
    remap_default_keys = true, -- Remap `gf`, `gF`, and `<leader>gf` to Pathfinder's functions
    selection_keys = { "a", "s", "d", "f", "j", "k", "l" }, -- Keys to use for selection in `select_file()` and `select_file_line()`
}

return opts
