---@type table
local Indent = {
    -- enable indent guides
    enabled = true,
    priority = 1,
    char = "│",
    -- only show indent guides of the scope
    only_scope = false,
    -- only show indent guides in the current window
    only_current = false,
    ---@type string|string[] hl groups for indent guides
    hl = "SnacksIndent",
    -- can be a list of hl groups to cycle through
    --[[
        hl = {
            "SnacksIndent1",
            "SnacksIndent2",
            "SnacksIndent3",
            "SnacksIndent4",
            "SnacksIndent5",
            "SnacksIndent6",
            "SnacksIndent7",
            "SnacksIndent8",
        },
        ]]
}

return Indent
