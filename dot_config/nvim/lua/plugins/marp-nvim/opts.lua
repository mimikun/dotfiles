---@type string
local marp_command
marp_command = "/opt/homebrew/opt/node/bin/node /opt/homebrew/bin/marp"
marp_command = "npx @marp-team/marp-cli@latest"

---@type table
local opts = {
    -- Marp CLI command (uses local marp if available)
    marp_command = marp_command,

    -- Browser command (nil = auto-detect)
    browser = nil,

    -- Available themes
    themes = {
        default = "default",
        gaia = "gaia",
        uncover = "uncover",
    },

    -- New features
    server_mode = false, -- Use server mode (-s) or watch mode (--watch)
}

return opts
