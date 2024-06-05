---@type table
local keys = {
    { "<C-a>", desc = "<C-a> increment" },
    { "<C-x>", desc = "<C-x> decrement" },
}

---@type LazySpec
local spec = {
    "monaqa/dial.nvim",
    --lazy = false,
    event = "VimEnter",
    keys = keys,
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

return spec
