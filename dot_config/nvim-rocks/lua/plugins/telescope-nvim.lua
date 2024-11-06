local is_windows = require("config.global").is_windows
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local canned = require("telescope._extensions.media.lib.canned")
local tundo_actions = require("telescope-undo.actions")

local ext_confs = {
    fzf = {
        -- false will only do exact matching
        fuzzy = true,
        -- override the generic sorter
        override_generic_sorter = true,
        -- override the file sorter
        override_file_sorter = true,
        -- or "ignore_case" or "respect_case"
        case_mode = "smart_case",
        --case_mode = "ignore_case",
        --case_mode = "respect_case",
    },
    media = {
        backend = "file",
        flags = {
            catimg = { move = false },
            chafa = { move = false },
            viu = { move = false },
            -- cannot calculate terminal paddings adjust them yourselves
            ueberzug = { xmove = -12, ymove = -3, warnings = true, suppress_backend_warning = false },
        },
        callbacks = {
            on_confirm_single = function(...)
                canned.single.copy_path(...)
            end,
            on_confirm_multiple = function(...)
                canned.multiple.bulk_copy(...)
            end,
        },
        cache_path = "/tmp/media",
        preview_title = "Preview",
        results_title = "Files",
        prompt_title = "Media",
        cwd = vim.fn.getcwd(),
        preview = {
            check_mime_type = true,
            timeout = 200,
            redraw = false,
            wait = 10,
            fill = {
                mime = "",
                file = "~",
                error = ":",
                binary = "X",
                timeout = "+",
                permission = "╱",
            },
        },
        log = {
            plugin = "telescope-media",
            level = "warn",
            highlights = true,
            use_file = true,
            use_quickfix = false,
        },
    },
    frecency = {
        auto_validate = true,
        db_root = vim.fn.stdpath("state"),
        db_safe_mode = true,
        db_validate_threshold = 10,
        default_workspace = nil,
        disable_devicons = false,
        hide_current_buffer = false,
        --filter_delimiter = nil,
        --[[
        --ignore_patterns = nil
            Default:
              for non-Windows: `{ "*.git/*", "*/tmp/*", "term://*" }`
              for Windows: `{ [[*.git\*] ], [ [*\tmp\*] ], "term://*" }`
            Type: `string`
        ]]
        matcher = "fuzzy",
        max_timestamps = 10,
        path_display = { "filename_first" },
        recency_values = {
            -- past 4 hours
            { age = 240, value = 100 },
            -- past day
            { age = 1440, value = 80 },
            -- past 3 days
            { age = 4320, value = 60 },
            -- past week
            { age = 10080, value = 40 },
            -- past month
            { age = 43200, value = 20 },
            -- past 90 days
            { age = 129600, value = 10 },
        },
        scoring_function = function(recency, fzy_score)
            local score = (10 / (recency == 0 and 1 or recency)) - 1 / fzy_score
            return score == -1 and -1.000001 or score
        end,
        show_filter_column = true,
        show_scores = false,
        show_unindexed = true,
        workspace_scan_cmd = nil,
        workspaces = {},
    },
    smart_open = {
        show_scores = true,
        ignore_patterns = { "*.git/*", "*/tmp/*" },
        match_algorithm = is_windows and "fzy" or "fzf",
        disable_devicons = false,
        open_buffer_indicators = { previous = "•", others = "∘" },
    },
    file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        --hijack_netrw = true,
    },
    package_info = {
        theme = "ivy",
    },
    zoxide = {
        prompt_title = "[ Walking on the shoulders of TJ ]",
        mappings = {
            default = {
                after_action = function(selection)
                    print("Update to (" .. selection.z_score .. ") " .. selection.path)
                end,
            },
            ["<C-s>"] = {
                before_action = function(selection)
                    print("before C-s")
                end,
                action = function(selection)
                    vim.cmd.edit(selection.path)
                end,
            },
            ["<C-q>"] = {
                action = require("telescope._extensions.zoxide.utils").create_basic_command("split"),
            },
        },
    },
    undo = {
        use_delta = true,
        -- should be in this format: { "bash", "-c", "echo '$DIFF' | delta" }
        use_custom_command = nil,
        side_by_side = false,
        vim_diff_opts = {
            ctxlen = vim.o.scrolloff,
        },
        entry_format = "state #$ID, $STAT, $TIME",
        time_format = "",
        saved_only = false,
        mappings = {
            i = {
                ["<cr>"] = tundo_actions.yank_additions,
                ["<S-cr>"] = tundo_actions.yank_deletions,
                ["<C-cr>"] = tundo_actions.restore,
                -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                --["<C-y>"] = tundo_actions.yank_deletions,
                --["<C-r>"] = tundo_actions.restore,
            },
            n = {
                ["y"] = tundo_actions.yank_additions,
                ["Y"] = tundo_actions.yank_deletions,
                ["u"] = tundo_actions.restore,
            },
        },
    },
    aerial = {
        -- How to format the symbols
        format_symbol = function(symbol_path, filetype)
            if filetype == "json" or filetype == "yaml" then
                return table.concat(symbol_path, ".")
            else
                return symbol_path[#symbol_path]
            end
        end,
        -- Available modes: symbols, lines, both
        show_columns = "both",
    },
}

local extensions = {
    --frecency = ext_confs.frecency,
    -- TODO: uncomment only it
    smart_open = ext_confs.smart_open,
    --file_browser = ext_confs.file_browser,
    --package_info = ext_confs.package_info,
    --zoxide = ext_confs.zoxide,
    --undo = ext_confs.undo,
    --aerial = ext_confs.aerial,
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    table.insert(extensions, ext_confs.fzf)
    --table.insert(extensions, ext_confs.media)
end

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ["<esc>"] = require("telescope.actions").close,
            },
            n = {
                ["<C-h>"] = "which_key",
            },
        },
        winblend = 20,
    },
    extensions = extensions,
})

-- Load some extensions

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    telescope.load_extension("fzf")
    --telescope.load_extension("media")
end
--telescope.load_extension("frecency")
telescope.load_extension("smart_open")
--telescope.load_extension("notify")
--telescope.load_extension("glyph")
--telescope.load_extension("emoji")
--telescope.load_extension("lazy")
--telescope.load_extension("file_browser")
--telescope.load_extension("egrepify")
--telescope.load_extension("package_info")
--telescope.load_extension("scope")
--telescope.load_extension("zoxide")
--telescope.load_extension("undo")
--telescope.load_extension("pomodori")
--telescope.load_extension("chezmoi")
--telescope.load_extension("treesitter_info")
--telescope.load_extension("completion")
--telescope.load_extension("repo")
--telescope.load_extension("grapple")
--telescope.load_extension("lazygit")
--telescope.load_extension("noice")
--telescope.load_extension("find_template")
--telescope.load_extension("aerial")
--telescope.load_extension("repos")

vim.keymap.set("n", "<leader>ff", function()
    builtin.find_files()
end, {})

vim.keymap.set("n", "<leader>fg", function()
    builtin.live_grep()
end, {})

vim.keymap.set("n", "<leader>fb", function()
    builtin.buffers()
end, {})

vim.keymap.set("n", "<leader>fh", function()
    builtin.help_tags(require("telescope.themes").get_ivy())
end, {})
