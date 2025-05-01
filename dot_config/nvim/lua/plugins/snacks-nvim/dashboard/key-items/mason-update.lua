---@type snacks.dashboard.Item
local mason_update = {
    icon = "",
    key = "m",
    desc = "Update Mason",
    action = function()
        vim.cmd(":MasonUpdateAll")
    end,
}

return mason_update
