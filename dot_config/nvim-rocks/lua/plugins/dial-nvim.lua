---@type table
local key_opts = {}

vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end, key_opts)

vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end, key_opts)

vim.keymap.set("v", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
end, key_opts)

vim.keymap.set("v", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
end, key_opts)
