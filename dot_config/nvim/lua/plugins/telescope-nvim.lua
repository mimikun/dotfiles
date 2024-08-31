---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    --lazy = false,
    cmd = "Telescope",
    keys = require("plugins.configs.telescope-nvim.keys"),
    --event = "VeryLazy",
    dependencies = require("plugins.configs.telescope-nvim.dependencies"),
    config = function()
        local telescope = require("telescope")

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
            extensions = require("plugins.configs.telescope-nvim.extensions"),
        })

        -- Load some extensions

        -- NOTE: Add fzf_sorter if not a Windows
        -- Very difficult to build fzf on Windows
        if not require("config.global").is_windows then
            telescope.load_extension("fzf")
            telescope.load_extension("media")
        end
        telescope.load_extension("frecency")
        telescope.load_extension("smart_open")
        telescope.load_extension("notify")
        telescope.load_extension("glyph")
        telescope.load_extension("emoji")
        telescope.load_extension("lazy")
        telescope.load_extension("file_browser")
        telescope.load_extension("egrepify")
        telescope.load_extension("package_info")
        telescope.load_extension("scope")
        telescope.load_extension("zoxide")
        telescope.load_extension("undo")
        telescope.load_extension("pomodori")
        telescope.load_extension("chezmoi")
        telescope.load_extension("treesitter_info")
        telescope.load_extension("completion")
        telescope.load_extension("repo")
        telescope.load_extension("grapple")
        telescope.load_extension("lazygit")
        telescope.load_extension("noice")
        telescope.load_extension("find_template")
    end,
    --cond = false,
}

return spec
