---@type table
local cmds = {
    "ConvertFindNext",
    "ConvertFindCurrent",
}

---@type table
local keys = {
    { "<leader>cn", desc = "Find next convertible unit" },
    { "<leader>cc", desc = "Find convertible unit in current line" },
}

---@type LazySpec
local spec = {
    "cjodo/convert.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>cn", "<cmd>ConvertFindNext<CR>", { desc = "Find next convertible unit" })
        vim.keymap.set(
            "n",
            "<leader>cc",
            "<cmd>ConvertFindCurrent<CR>",
            { desc = "Find convertible unit in current line" }
        )
    end,
    --cond = false,
}

return spec
