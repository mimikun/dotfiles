---@type table
local opts = {
    mapping = {
        ["<Tab>"] = "choose_action",
        ["<C-l>"] = "refresh",
        ["i"] = "prompt",
        ["a"] = "prompt",
        ["@"] = "toggle_select",
        ["*"] = "toggle_select_all",
        ["p"] = "toggle_preview_mode",
        ["<C-k>"] = "scroll_preview_up",
        ["<C-j>"] = "scroll_preview_down",
        ["<CR>"] = { "default", "open" },
    },
}

---@type LazySpec
local spec = {
    "hrsh7th/nvim-deck",
    branch = "dev",
    --lazy = false,
    --cmd = cmds,
    --keys = keys,
    config = function()
        local deck = require("deck")
        local recent_files = require("deck.builtin.source.recent_files")
        local recent_dirs = require("deck.builtin.source.recent_dirs")
        local files = require("deck.builtin.source.files")
        local git = require("deck.builtin.source.git")
        local git_status = require("deck.builtin.source.git.status")
        local git_branch = require("deck.builtin.source.git.branch")
        local git_log = require("deck.builtin.source.git.log")

        deck.setup(opts)

        -- Example `open` action for file-kind.
        deck.register_action({
            name = "open",
            resolve = function(ctx)
                local item = ctx.get_cursor_item()
                return item and item.filename
            end,
            execute = function(item)
                vim.cmd("edit " .. item.filename)
            end,
        })

        --- autocmds
        -- Add recent files.
        vim.api.nvim_create_autocmd("BufWinEnter", {
            callback = function(e)
                local bufname = vim.api.nvim_buf_get_name(0)
                if vim.fn.filereadable(bufname) == 1 then
                    recent_files.add(vim.fs.normalize(bufname))
                end
            end,
        })

        -- Add recent dirs.
        vim.api.nvim_create_autocmd("DirChanged", {
            callback = function(e)
                recent_dirs.add(e.cwd)
            end,
        })

        --- Example keymaps
        -- Listing files recursively.
        vim.keymap.set("n", "<Leader>f", function()
            deck.execute(files()({
                root_dir = vim.fn.getcwd(),
            }))
        end)

        -- Open recent deck window.
        vim.keymap.set("n", "<Leader>;", function()
            local context = deck.get_history()[1]
            if context then
                context.show()
            end
        end)

        -- Do default action on next item of recent deck context.
        vim.keymap.set("n", "<C-n>", function()
            local context = deck.get_history()[1]
            if context then
                context.set_cursor(context.get_cursor() + 1)
                context.do_action("default")
            end
        end)

        -- Do default action on prev item of recent deck context.
        vim.keymap.set("n", "<C-p>", function()
            local context = deck.get_history()[1]
            if context then
                context.set_cursor(context.get_cursor() - 1)
                context.do_action("default")
            end
        end)

        -- User commands
        vim.api.nvim_create_user_command("DeckFiles", function()
            deck.execute(files()({
                root_dir = vim.fn.getcwd(),
            }))
        end, {})

        vim.api.nvim_create_user_command("DeckRecentFiles", function()
            deck.execute(recent_files())
        end, {})

        vim.api.nvim_create_user_command("DeckRecentDirs", function()
            deck.execute(recent_dirs())
        end, {})

        vim.api.nvim_create_user_command("DeckGit", function()
            deck.execute(git()({
                cwd = vim.fn.getcwd(),
            }))
        end, {})

        vim.api.nvim_create_user_command("DeckGitStatus", function()
            deck.execute(git_status()({
                cwd = vim.fn.getcwd(),
            }))
        end, {})

        vim.api.nvim_create_user_command("DeckGitBranch", function()
            deck.execute(git_branch()({
                cwd = vim.fn.getcwd(),
            }))
        end, {})

        vim.api.nvim_create_user_command("DeckGitLog", function()
            deck.execute(git_log()({
                cwd = vim.fn.getcwd(),
            }))
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
--[[
require('deck.builtin.source.grep')(option)`
Find pattern in specified directory via `ripgrep`.

NOTE: if you specify `option.dynamic = true`, you should omit `option.pattern`.

| option | type | description |
|--------|------|-------------|
| root_dir | string | Root directory to find pattern. |
| ignore_globs | string[]? | Ignore files matched by globs. |
| pattern | string? | Pattern to find. |
| dynamic | boolean? | If true, update list dynamically. |
]]
