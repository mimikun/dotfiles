---@type ClaudeCodeConfig
local opts = {
    window = {
        ---@type string "botright" | "topleft" | "vertical" | "rightbelow vsplit"
        position = "botright",
        enter_insert = true, -- Whether to enter insert mode when opening Claude Code
    },
}

return opts
