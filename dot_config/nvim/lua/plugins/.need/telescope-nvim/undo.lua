local ext = {
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
            ["<cr>"] = require("telescope-undo.actions").yank_additions,
            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            ["<C-cr>"] = require("telescope-undo.actions").restore,
            -- alternative defaults, for users whose terminals do questionable things with modified <cr>
            ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
            ["<C-r>"] = require("telescope-undo.actions").restore,
        },
        n = {
            ["y"] = require("telescope-undo.actions").yank_additions,
            ["Y"] = require("telescope-undo.actions").yank_deletions,
            ["u"] = require("telescope-undo.actions").restore,
        },
    },
}

return ext
