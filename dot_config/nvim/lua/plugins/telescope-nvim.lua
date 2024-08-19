---@type boolean
local is_windows = require("config.global").is_windows

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ff",
        function()
            require("telescope.builtin").find_files()
        end,
        mode = "n",
        desc = "Search for files (respecting .gitignore)",
    },
    {
        "<leader>fg",
        function()
            require("telescope.builtin").live_grep()
        end,
        mode = "n",
        desc = "Search for a string and get results live as you type, respects .gitignore",
    },
    {
        "<leader>fb",
        function()
            require("telescope.builtin").buffers()
        end,
        mode = "n",
        desc = "Lists open buffers in current neovim instance, opens selected buffer on <CR>",
    },
    {
        "<leader>fh",
        function()
            require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
        end,
        mode = "n",
        desc = "Lists available help tags and opens a new window with the relevant help info on <CR>",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "danielfalk/smart-open.nvim",
    "rcarriga/nvim-notify",
    --"ghassan0/telescope-glyph.nvim",
    --"xiyaowong/telescope-emoji.nvim",
    --"tsakirist/telescope-lazy.nvim",
    --"fdschmidt93/telescope-egrepify.nvim",
    --"nvim-telescope/telescope-file-browser.nvim",
    --"vuki656/package-info.nvim",
    --"tiagovla/scope.nvim",
    --"nvim-lua/popup.nvim",
    --"jvgrootveld/telescope-zoxide",
    --"debugloop/telescope-undo.nvim",
    --"epwalsh/pomo.nvim",
    --"GianniBYoung/chezmoi-telescope.nvim",
    --"roycrippen4/telescope-treesitter-info.nvim",
    --"illia-shkroba/telescope-completion.nvim",
    --"cljoly/telescope-repo.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    table.insert(dependencies, {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    })
    --[[
    table.insert(dependencies, {
        "dharmx/telescope-media.nvim",
    })
    ]]
end

---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    --lazy = false,
    --cmd = "CMDNAME",
    keys = keys,
    --event = "VeryLazy",
    dependencies = dependencies,
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
        if not is_windows then
            telescope.load_extension("fzf")
            --telescope.load_extension("media")
        end
        telescope.load_extension("frecency")
        telescope.load_extension("smart_open")
        telescope.load_extension("notify")
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
    end,
    --cond = false,
}

return spec
