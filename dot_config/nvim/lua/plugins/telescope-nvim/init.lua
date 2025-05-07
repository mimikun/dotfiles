---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    --lazy = false,
    cmd = "Telescope",
    keys = require("plugins.telescope-nvim.keys"),
    dependencies = require("plugins.telescope-nvim.dependencies"),
    config = function()
        local telescope = require("telescope")

        telescope.setup(require("plugins.telescope-nvim.opts"))

        -- Load some extensions
        -- NOTE: Add fzf_sorter if not a Windows
        -- Very difficult to build fzf on Windows
        if not require("config.global").is_windows then
            telescope.load_extension("fzf")
            --telescope.load_extension("media")
            telescope.load_extension("media_files")
        end
        --telescope.load_extension("frecency")
        telescope.load_extension("smart_open")
        telescope.load_extension("yank_history")
        telescope.load_extension("ecolog")
        --telescope.load_extension("live_grep_args")
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
        telescope.load_extension("treesitter_info")
        --telescope.load_extension("completion")
        --telescope.load_extension("repo")
        --telescope.load_extension("grapple")
        --telescope.load_extension("lazygit")
        --telescope.load_extension("noice")
        --telescope.load_extension("find_template")
        --telescope.load_extension("aerial")
        --telescope.load_extension("repos")
        --telescope.load_extension("orgmode")
        --telescope.load_extension("neovimcraft")
        --telescope.load_extension("avante")
        --telescope.load_extension("prompts")
        --telescope.load_extension("refactoring")
        --telescope.load_extension("nerdy")
        --telescope.load_extension("import")
        --telescope.load_extension("live_grep_history")
        --telescope.load_extension("REPLShow")
        --telescope.load_extension("remote-sshfs")
        --telescope.load_extension("git_recent")
        --telescope.load_extension("flutter")
        telescope.load_extension("ascii")
    end,
    --cond = false,
    --enabled = false,
}

return spec
