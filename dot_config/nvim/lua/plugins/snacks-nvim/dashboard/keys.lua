---@type snacks.dashboard.Item[]
local keys = {
    -- New file
    require("plugins.snacks-nvim.dashboard.items.new_file"),
    -- Utilities
    require("plugins.snacks-nvim.dashboard.items.lazy-home"),
    require("plugins.snacks-nvim.dashboard.items.treesitter-info"),
    require("plugins.snacks-nvim.dashboard.items.mason-open"),
    -- Updates
    require("plugins.snacks-nvim.dashboard.items.hydra-update-menu"),
    --require("plugins.snacks-nvim.dashboard.items.lazy-update"),
    --require("plugins.snacks-nvim.dashboard.items.treesitter-update"),
    --require("plugins.snacks-nvim.dashboard.items.mason-update"),
    -- Feed
    require("plugins.snacks-nvim.dashboard.items.feed-open"),
    -- telekasten
    require("plugins.snacks-nvim.dashboard.items.telekasten-open"),
    -- checkhealth
    require("plugins.snacks-nvim.dashboard.items.check-health"),
    -- dotfyle-metadata.nvim
    --require("plugins.snacks-nvim.dashboard.items.generate-dotfyle"),
    -- Quit
    require("plugins.snacks-nvim.dashboard.items.quit"),
}

return keys
