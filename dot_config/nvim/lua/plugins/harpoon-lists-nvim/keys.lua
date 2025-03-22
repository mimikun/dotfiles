---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ha",
        function()
            require("harpoon-lists"):list():add()
        end,
        mode = "n",
        { desc = "Add current file to Harpoon list" },
    },
    {
        "<leader>hr",
        function()
            require("harpoon-lists"):list():remove()
        end,
        mode = "n",
        { desc = "Remove current file from Harpoon list" },
    },
    {
        "<C-h>",
        function()
            require("harpoon-lists").harpoon.ui:toggle_quick_menu(require("harpoon-lists"):list())
        end,
        mode = "n",
        { desc = "Toggle Harpoon list" },
    },
    {
        "<leader>1",
        function()
            require("harpoon-lists"):list():select(1)
        end,
        mode = "n",
        { desc = "Select first buffer in Harpoon list" },
    },
    {
        "<leader>2",
        function()
            require("harpoon-lists"):list():select(2)
        end,
        mode = "n",
        { desc = "Select second buffer in Harpoon list" },
    },
    {
        "<leader>3",
        function()
            require("harpoon-lists"):list():select(3)
        end,
        mode = "n",
        { desc = "Select third buffer in Harpoon list" },
    },
    {
        "<leader>4",
        function()
            require("harpoon-lists"):list():select(4)
        end,
        mode = "n",
        { desc = "Select fourth buffer in Harpoon list" },
    },
    {
        "<leader>5",
        function()
            require("harpoon-lists"):list():select(5)
        end,
        mode = "n",
        { desc = "Select fifth buffer in Harpoon list" },
    },
    {
        "<leader>6",
        function()
            require("harpoon-lists"):list():select(6)
        end,
        mode = "n",
        { desc = "Select sixth buffer in Harpoon list" },
    },
    {
        "<leader>7",
        function()
            require("harpoon-lists"):list():select(7)
        end,
        mode = "n",
        { desc = "Select seventh buffer in Harpoon list" },
    },
    {
        "<leader>8",
        function()
            require("harpoon-lists"):list():select(8)
        end,
        mode = "n",
        { desc = "Select eighth buffer in Harpoon list" },
    },
    {
        "<leader>9",
        function()
            require("harpoon-lists"):list():select(9)
        end,
        mode = "n",
        { desc = "Select ninth buffer in Harpoon list" },
    },
    -- Toggle previous & next buffers stored within Harpoon list
    {
        "<leader>hp",
        function()
            require("harpoon-lists"):list():prev({ ui_nav_wrap = true })
        end,
        mode = "n",
        { desc = "Go to previous buffer in Harpoon list" },
    },
    {
        "<leader>hn",
        function()
            require("harpoon-lists"):list():next({ ui_nav_wrap = true })
        end,
        mode = "n",
        { desc = "Go to next buffer in Harpoon list" },
    },
}

return keys
