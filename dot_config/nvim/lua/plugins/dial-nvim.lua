local keymaps = {
    { "<C-a>", desc = "<C-a> increment" },
    { "<C-x>", desc = "<C-x> decrement" },
}

return {
    "monaqa/dial.nvim",
    --lazy = false,
    event = "VimEnter",
    keys = keymaps,
    config = function()
        vim.keymap.set("n", "<C-a>", function()
            require("dial.map").manipulate("increment", "normal")
        end)
        vim.keymap.set("n", "<C-x>", function()
            require("dial.map").manipulate("decrement", "normal")
        end)
    end,
    --cond = false,
}
