---@type table
local key_mode = { "n" }

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>a",
        function()
            require("harpoon"):list():add()
        end,
        mode = key_mode,
    },
    {
        "<C-e>",
        function()
            require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        mode = key_mode,
    },
    {
        "<C-h>",
        function()
            require("harpoon"):list():select(1)
        end,
        mode = key_mode,
    },
    {
        "<C-t>",
        function()
            require("harpoon"):list():select(2)
        end,
        mode = key_mode,
    },
    {
        "<C-n>",
        function()
            require("harpoon"):list():select(3)
        end,
        mode = key_mode,
    },
    {
        "<C-s>",
        function()
            require("harpoon"):list():select(4)
        end,
        mode = key_mode,
    },
    -- Toggle previous & next buffers stored within Harpoon list
    {
        "<C-S-P>",
        function()
            require("harpoon"):list():prev()
        end,
        mode = key_mode,
    },
    {
        "<C-S-N>",
        function()
            require("harpoon"):list():next()
        end,
        mode = key_mode,
    },
}

return keys
