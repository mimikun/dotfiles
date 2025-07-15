---@module 'PickMe'
---@type PickMe.Config.config
local opts = {
    picker_provider = "telescope",
    detect_provider = true,
    add_default_keybindings = true,
    command_aliases = {
        grep = "live_grep",
    },
}

return opts
