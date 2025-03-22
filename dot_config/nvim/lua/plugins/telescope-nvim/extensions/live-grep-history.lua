---@type table
local live_grep_history_config = {
    -- Customize key mappings
    mappings = {
        up_key = "<Up>", -- Navigate to older search history
        down_key = "<Down>", -- Navigate to newer search history
        confirm_key = "<CR>", -- Execute search and save to history
    },
    max_history = 100, -- Maximum number of history entries to save
}

return live_grep_history_config
