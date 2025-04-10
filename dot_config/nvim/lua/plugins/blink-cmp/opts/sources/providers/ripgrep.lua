---@module "blink-ripgrep"
---@type blink-ripgrep.Options
local opts = {
    prefix_min_len = 3,
    context_size = 5,
    max_filesize = "1M",
    project_root_marker = ".git",
    project_root_fallback = true,
    search_casing = "--ignore-case",
    additional_rg_options = {},
    fallback_to_regex_highlighting = true,

    -- Absolute root paths where the rg command will not be executed.
    -- Usually you want to exclude paths using gitignore files or
    -- ripgrep specific ignore files, but this can be used to only
    -- ignore the paths in blink-ripgrep.nvim, maintaining the ability
    -- to use ripgrep for those paths on the command line. If you need
    -- to find out where the searches are executed, enable `debug` and
    -- look at `:messages`.
    ignore_paths = {},

    -- Any additional paths to search in, in addition to the project
    -- root. This can be useful if you want to include dictionary files
    -- (/usr/share/dict/words), framework documentation, or any other
    -- reference material that is not available within the project
    -- root.
    additional_paths = {},

    -- Keymaps to toggle features on/off. This can be used to alter
    -- the behavior of the plugin without restarting Neovim. Nothing
    -- is enabled by default. Requires folke/snacks.nvim.
    toggles = {
        -- The keymap to toggle the plugin on and off from blink
        -- completion results. Example: "<leader>tg"
        on_off = nil,
    },

    -- Features that are not yet stable and might change in the future.
    -- You can enable these to try them out beforehand, but be aware
    -- that they might change. Nothing is enabled by default.
    future_features = {
        -- Workaround for
        -- https://github.com/mikavilpas/blink-ripgrep.nvim/issues/185. This
        -- is a temporary fix and will be removed in the future.
        issue185_workaround = false,

        backend = {
            -- The backend to use for searching. Defaults to "ripgrep".
            -- Available options:
            -- - "ripgrep", always use ripgrep
            -- - "gitgrep", always use git grep
            -- - "gitgrep-or-ripgrep", use git grep if possible, otherwise
            --   ripgrep
            use = "ripgrep",
        },
    },

    -- Show debug information in `:messages` that can help in
    -- diagnosing issues with the plugin.
    debug = false,
}

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local ripgrep = {
    module = "blink-ripgrep",
    name = "Ripgrep",
    opts = opts,
    -- (optional) customize how the results are displayed.
    -- Many options are available - make sure your lua LSP is set up so you get autocompletion help
    transform_items = function(_, items)
        for _, item in ipairs(items) do
            -- example: append a description to easily distinguish rg results
            item.labelDetails = {
                description = "(rg)",
            }
        end
        return items
    end,
}

return ripgrep
