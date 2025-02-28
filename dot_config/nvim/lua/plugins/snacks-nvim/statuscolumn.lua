---@class snacks.statuscolumn.Config
---@field left snacks.statuscolumn.Components
---@field right snacks.statuscolumn.Components
---@field enabled? boolean
local Config = {
    enabled = false,
    -- priority of signs on the left (high to low)
    left = { "mark", "sign" },
    -- priority of signs on the right (high to low)
    right = { "fold", "git" },
    folds = {
        open = false,
        -- show open fold icons
        -- use Git Signs hl for fold icons
        git_hl = false,
    },
    git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
    },
    -- refresh at most every 50ms
    refresh = 50,
}

return Config
