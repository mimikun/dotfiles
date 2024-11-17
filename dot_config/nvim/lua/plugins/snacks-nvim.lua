---@type table
local cmds = {
    "ClearNotify",
    "SnackClearNotify",
    "SnackLazyGit",
    "SnackGitBlame",
    "SnackGitBrowse",
    "SnackLazyGitLogFiles",
    "SnackLazyGitLogs",
    "SnackToggleTerm",
    "SnackWhichKey",
}

---@type LazySpec[]
local dependencies = {
    "echasnovski/mini.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    styles = {
        -- TODO: it?
    },
    bigfile = {
        enabled = true,
    },
    notifier = {
        enabled = true,
    },
    quickfile = {
        enabled = true,
    },
    statuscolumn = {
        enabled = true,
        -- refresh at most every 50ms
        refresh = 50,
    },
    words = {
        enabled = true,
        -- time in ms to wait before updating
        debounce = 200,
    },
}

---@type LazySpec
local spec = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    config = function()
        require("snacks").setup(opts)

        -- Dismiss All Notifications
        vim.api.nvim_create_user_command("ClearNotify", function()
            Snacks.notifier.hide()
        end, {})
        vim.api.nvim_create_user_command("SnackClearNotify", function()
            Snacks.notifier.hide()
        end, {})

        -- Open Lazygit (yet another)
        vim.api.nvim_create_user_command("SnackLazyGit", function()
            Snacks.lazygit()
        end, {})

        -- Open Git Blame Line
        vim.api.nvim_create_user_command("SnackGitBlame", function()
            Snacks.git.blame_line()
        end, {})

        -- Git Browse
        vim.api.nvim_create_user_command("SnackGitBrowse", function()
            Snacks.gitbrowse()
        end, {})

        -- Open Lazygit Current File History
        vim.api.nvim_create_user_command("SnackLazyGitLogFiles", function()
            Snacks.lazygit.log_file()
        end, {})

        -- Open Lazygit Log (cwd)
        vim.api.nvim_create_user_command("SnackLazyGitLogs", function()
            Snacks.lazygit.log()
        end, {})

        -- Toggle Terminal
        vim.api.nvim_create_user_command("SnackToggleTerm", function()
            Snacks.terminal()
        end, {})

        -- Open which_key_ignore
        vim.api.nvim_create_user_command("SnackWhichKey", function()
            Snacks.toggle()
        end, {})
    end,
    --cond = false,
    --enabled = false,
}

return spec
