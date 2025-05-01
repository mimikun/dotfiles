---@type snacks.dashboard.Item[]
local keys = {
    -- New file
    require("plugins.snacks-nvim.dashboard.key-items.new-file"),
    -- Dashboard menu
    require("plugins.snacks-nvim.dashboard.key-items.hydra-dashboard-menu"),
    --require("plugins.snacks-nvim.dashboard.key-items.lazy-home"),
    --require("plugins.snacks-nvim.dashboard.key-items.treesitter-info"),
    --require("plugins.snacks-nvim.dashboard.key-items.mason-open"),
    -- Update menu
    require("plugins.snacks-nvim.dashboard.key-items.hydra-update-menu"),
    --require("plugins.snacks-nvim.dashboard.key-items.lazy-update"),
    --require("plugins.snacks-nvim.dashboard.key-items.treesitter-update"),
    --require("plugins.snacks-nvim.dashboard.key-items.mason-update"),
    -- Generate menu
    require("plugins.snacks-nvim.dashboard.key-items.hydra-generate-menu"),
    --require("plugins.snacks-nvim.dashboard.key-items.generate-dotfyle"),
    -- Fuzzy finder
    --require("plugins.snacks-nvim.dashboard.key-items.hydra-fuzzy-finder"),
    -- Other menu
    require("plugins.snacks-nvim.dashboard.key-items.hydra-other-menu"),
    --require("plugins.snacks-nvim.dashboard.key-items.feed-open"),
    --require("plugins.snacks-nvim.dashboard.key-items.telekasten-open"),
    --require("plugins.snacks-nvim.dashboard.key-items.check-health"),
    -- Quit
    require("plugins.snacks-nvim.dashboard.key-items.quit"),
}

return keys
