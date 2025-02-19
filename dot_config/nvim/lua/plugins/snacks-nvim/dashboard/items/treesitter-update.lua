---@type snacks.dashboard.Item
local treesitter_update = {
    icon = "",
    key = "t",
    desc = "Update Treesitter",
    action = function()
        vim.cmd(":TSUpdate")
    end,
}

return treesitter_update
