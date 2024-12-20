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

return keys
