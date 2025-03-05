---@type table
local M = {}

M.git_signs = function()
    local status = vim.b.gitsigns_status_dict
    if not status then
        return ""
    end
    local root = status.root:gsub("^(.+[/\\])", "")
    local head = status.head
    local stage = ("%s+%s%s~%s%s!%s%s "):format(
        "%#Changed#",
        status.changed,
        "%#Added#",
        status.added,
        "%#Removed#",
        status.removed,
        "%*"
    )
    return ("%s %s %s "):format(root, head, stage)
end

return M
