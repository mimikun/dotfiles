---@type table
local keys = {
    { "<leader>a", desc = "Tag a file" },
    { "<c-e>", desc = "Toggle tags menu" },

    { "<c-h>", desc = "Select first tag" },
    { "<c-t>", desc = "Select second tag" },
    { "<c-n>", desc = "Select third tag" },
    { "<c-s>", desc = "Select fourth tag" },

    { "<c-s-n>", desc = "Go to next tag" },
    { "<c-s-p>", desc = "Go to previous tag" },
}

---@type LazySpec
local spec = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    --lazy = false,
    keys = keys,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "<c-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<c-h>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<c-t>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<c-n>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<c-s>", function()
            harpoon:list():select(4)
        end)

        vim.keymap.set("n", "<c-s-n>", function()
            harpoon:list():next()
        end)
        vim.keymap.set("n", "<c-s-p>", function()
            harpoon:list():prev()
        end)
    end,
    cond = false,
}

return spec
