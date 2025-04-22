local g = require("config.global")

---@type string
local config = table.concat({ g.home, ".config", "mcphub", "servers.json" }, g.path_sep)

---@type table
local opts = {
    -- TODO: fix it
    port = 37373,
    config = config,
    native_servers = {},
    auto_approve = false,
    auto_toggle_mcp_servers = true,
    extensions = {
        avante = {
            make_slash_commands = true,
        },
        codecompanion = {
            show_result_in_chat = true,
            make_vars = true,
            make_slash_commands = true,
        },
    },
    ui = {
        window = {
            -- "none", "single", "double", "rounded", "solid", "shadow"
            border = "rounded",
        },
    },
}

return opts
