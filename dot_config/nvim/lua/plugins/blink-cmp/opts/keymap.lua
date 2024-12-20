local keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<C-y>"] = { "select_and_accept" },
    -- enter keymap
    -- you may want to set
    -- completion.list.selection = "manual" | "auto_insert"
    --['<CR>'] = { 'accept', 'fallback' },

    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-n>"] = { "select_next", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    -- default keymap
    ["<Tab>"] = { "snippet_forward", "fallback" },
    -- super-tab keymap
    -- you may want to set A or use B
    -- A: completion.trigger.show_in_snippet = false
    -- B: completion.list.selection = "manual" | "auto_insert"
    --["<Tab>"] = {
    --    function(cmp)
    --        if cmp.snippet_active() then
    --            return cmp.accept()
    --        else
    --            return cmp.select_and_accept()
    --        end
    --    end,
    --    "snippet_forward",
    --    "fallback",
    --},
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
    -- Select Nth item from the list
    ["<A-1>"] = {
        function(cmp)
            cmp.accept({ index = 1 })
        end,
    },
    ["<A-2>"] = {
        function(cmp)
            cmp.accept({ index = 2 })
        end,
    },
    ["<A-3>"] = {
        function(cmp)
            cmp.accept({ index = 3 })
        end,
    },
    ["<A-4>"] = {
        function(cmp)
            cmp.accept({ index = 4 })
        end,
    },
    ["<A-5>"] = {
        function(cmp)
            cmp.accept({ index = 5 })
        end,
    },
    ["<A-6>"] = {
        function(cmp)
            cmp.accept({ index = 6 })
        end,
    },
    ["<A-7>"] = {
        function(cmp)
            cmp.accept({ index = 7 })
        end,
    },
    ["<A-8>"] = {
        function(cmp)
            cmp.accept({ index = 8 })
        end,
    },
    ["<A-9>"] = {
        function(cmp)
            cmp.accept({ index = 9 })
        end,
    },

    -- optionally, define different keymaps for cmdline
    cmdline = {
        preset = "super-tab",
    },
}

return keymap
