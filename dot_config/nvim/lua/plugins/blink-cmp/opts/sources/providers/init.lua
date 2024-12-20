local providers = {
    lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",

        --- *All* providers have the following options available
        --- NOTE: All of these options may be functions to get dynamic behavior
        --- See the type definitions for more information.
        enabled = true, -- Whether or not to enable the provider
        async = false, -- Whether we should wait for the provider to return before showing the completions
        timeout_ms = 2000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
        --transform_items = nil, -- Function to transform the items before they're returned
        -- Filter out text items from the LSP provider, since we have the buffer provider for that
        transform_items = function(_, items)
            return vim.tbl_filter(function(item)
                return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
            end, items)
        end,
        should_show_items = true, -- Whether or not to show the items
        max_items = nil, -- Maximum number of items to display in the menu
        min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
        -- If this provider returns 0 items, it will fallback to these providers.
        -- If multiple providers falback to the same provider, all of the providers must return 0 items for it to fallback
        fallbacks = { "buffer" },
        score_offset = 0, -- Boost/penalize the score of the items
        override = nil, -- Override the source's functions
    },
    path = {
        name = "Path",
        module = "blink.cmp.sources.path",
        score_offset = 3,
        fallbacks = { "buffer" },
        opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = false,
        },
    },
    snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            global_snippets = { "all" },
            extended_filetypes = {},
            ignored_filetypes = {},
            get_filetype = function(context)
                return vim.bo.filetype
            end,
        },

        --- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
        -- enabled = function(ctx)
        --   return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter
        -- end,
    },
    luasnip = {
        name = "Luasnip",
        module = "blink.cmp.sources.luasnip",
        opts = {
            -- Whether to use show_condition for filtering snippets
            use_show_condition = true,
            -- Whether to show autosnippets in the completion list
            show_autosnippets = true,
        },
    },
    buffer = {
        name = "Buffer",
        module = "blink.cmp.sources.buffer",
        opts = {
            -- default to all visible buffers
            get_bufnrs = function()
                return vim.iter(vim.api.nvim_list_wins())
                    :map(function(win)
                        return vim.api.nvim_win_get_buf(win)
                    end)
                    :filter(function(buf)
                        return vim.bo[buf].buftype ~= "nofile"
                    end)
                    :totable()
            end,
        },
    },
}

return providers
