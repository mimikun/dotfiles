---@type table
local extensions = {
    mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
            show_result_in_chat = true, -- Show the mcp tool result in the chat buffer
            make_vars = true, -- make chat #variables from MCP server resources
            make_slash_commands = true, -- make /slash_commands from MCP server prompts
        },
    },
}

return extensions
