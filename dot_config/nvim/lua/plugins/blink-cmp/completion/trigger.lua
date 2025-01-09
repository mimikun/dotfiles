local trigger = {
    -- When true, will prefetch the completion items when entering insert mode
    prefetch_on_insert = false,

    -- NOTE: NEED
    show_in_snippet = false,

    -- When true, will show the completion window after typing any of alphanumerics, `-` or `_`
    show_on_keyword = true,

    -- When true, will show the completion window after typing a trigger character
    show_on_trigger_character = true,

    -- LSPs can indicate when to show the completion window via trigger characters
    -- however, some LSPs (i.e. tsserver) return characters that would essentially
    -- always show the window. We block these by default.
    show_on_blocked_trigger_characters = function()
        if vim.api.nvim_get_mode().mode == "c" then
            return {}
        end

        -- you can also block per filetype, for example:
        -- if vim.bo.filetype == 'markdown' then
        --   return { ' ', '\n', '\t', '.', '/', '(', '[' }
        -- end

        return { " ", "\n", "\t" }
    end,

    -- When both this and show_on_trigger_character are true, will show the completion window
    -- when the cursor comes after a trigger character after accepting an item
    show_on_accept_on_trigger_character = true,

    -- When both this and show_on_trigger_character are true, will show the completion window
    -- when the cursor comes after a trigger character when entering insert mode
    show_on_insert_on_trigger_character = true,

    -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
    -- the completion window when the cursor comes after a trigger character when
    -- entering insert mode/accepting an item
    show_on_x_blocked_trigger_characters = { "'", '"', "(" },
    -- or a function, similar to show_on_blocked_trigger_character
}

return trigger
