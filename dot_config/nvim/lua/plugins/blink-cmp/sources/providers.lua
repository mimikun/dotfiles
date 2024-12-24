-- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
local providers = {
    lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
    },
    path = {
        name = "Path",
        module = "blink.cmp.sources.path",
    },
    snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
    },
    luasnip = {
        name = "Luasnip",
        module = "blink.cmp.sources.luasnip",
    },
    buffer = {
        name = "Buffer",
        module = "blink.cmp.sources.buffer",
    },
    -- Custom providers
    lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        -- make lazydev completions top priority (see `:h blink.cmp`)
        score_offset = 100,
    },
    ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        -- the options below are optional, some default values are shown
        ---@module "blink-ripgrep"
        ---@type blink-ripgrep.Options
        opts = {
            -- For many options, see `rg --help` for an exact description of
            -- the values that ripgrep expects.

            -- the minimum length of the current word to start searching
            -- (if the word is shorter than this, the search will not start)
            prefix_min_len = 3,

            -- The number of lines to show around each match in the preview
            -- (documentation) window. For example, 5 means to show 5 lines
            -- before, then the match, and another 5 lines after the match.
            context_size = 5,

            -- The maximum file size of a file that ripgrep should include in
            -- its search. Useful when your project contains large files that
            -- might cause performance issues.
            -- Examples:
            -- "1024" (bytes by default), "200K", "1M", "1G", which will
            -- exclude files larger than that size.
            max_filesize = "1M",

            -- Specifies how to find the root of the project where the ripgrep
            -- search will start from. Accepts the same options as the marker
            -- given to `:h vim.fs.root()` which offers many possibilities for
            -- configuration. If none can be found, defaults to Neovim's cwd.
            --
            -- Examples:
            -- - ".git" (default)
            -- - { ".git", "package.json", ".root" }
            project_root_marker = ".git",

            -- The casing to use for the search in a format that ripgrep
            -- accepts. Defaults to "--ignore-case". See `rg --help` for all the
            -- available options ripgrep supports, but you can try
            -- "--case-sensitive" or "--smart-case".
            search_casing = "--ignore-case",

            -- (advanced) Any additional options you want to give to ripgrep.
            -- See `rg -h` for a list of all available options. Might be
            -- helpful in adjusting performance in specific situations.
            -- If you have an idea for a default, please open an issue!
            --
            -- Not everything will work (obviously).
            additional_rg_options = {},

            -- When a result is found for a file whose filetype does not have a
            -- treesitter parser installed, fall back to regex based highlighting
            -- that is bundled in Neovim.
            fallback_to_regex_highlighting = true,
        },
    },
    crates = {
        name = "crates",
        module = "blink.compat.source",
    },
    emoji = {
        name = "emoji",
        module = "blink.compat.source",
    },
    yanky = {
        name = "cmp_yanky",
        module = "blink.compat.source",
    },
    ecolog = {
        name = "ecolog",
        module = "ecolog.integrations.cmp.blink_cmp",
    },
    obsidian = {
        name = "obsidian",
        module = "blink.compat.source",
    },
    obsidian_new = {
        name = "obsidian_new",
        module = "blink.compat.source",
    },
    obsidian_tags = {
        name = "obsidian_tags",
        module = "blink.compat.source",
    },
    --[[
    codecompanion = {
        enabled = false,
        name = "CodeCompanion",
        module = "codecompanion.providers.completion.blink",
    },
    copilot = {
        enabled = false,
        name = "copilot",
        module = "blink-cmp-copilot",
        score_offset = 100,
        async = true,
        transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
                item.kind = kind_idx
            end
            return items
        end,
    },
    ]]
}

--[[
if require("config.settings").use_github_copilot then
    table.insert(providers, )
end
]]

return providers
