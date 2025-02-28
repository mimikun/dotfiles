---@class snacks.indent.Scope.Config: snacks.scope.Config
local Scope = {
    -- enable highlighting the current scope
    enabled = true,
    priority = 200,
    char = "│",
    -- underline the start of the scope
    underline = false,
    -- only show scope in the current window
    only_current = false,
    ---@type string|string[] hl group for scopes
    hl = "SnacksIndentScope",
}

return Scope
