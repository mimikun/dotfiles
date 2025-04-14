---@type snacks.dashboard.Item[]
local keys = {
    -- New file
    require("plugins.snacks-nvim.dashboard.items.new-file"),
    -- Dashboard menu
    require("plugins.snacks-nvim.dashboard.items.hydra-dashboard-menu"),
    --require("plugins.snacks-nvim.dashboard.items.lazy-home"),
    --require("plugins.snacks-nvim.dashboard.items.treesitter-info"),
    --require("plugins.snacks-nvim.dashboard.items.mason-open"),
    -- Update menu
    require("plugins.snacks-nvim.dashboard.items.hydra-update-menu"),
    --require("plugins.snacks-nvim.dashboard.items.lazy-update"),
    --require("plugins.snacks-nvim.dashboard.items.treesitter-update"),
    --require("plugins.snacks-nvim.dashboard.items.mason-update"),
    -- Generate menu
    require("plugins.snacks-nvim.dashboard.items.hydra-generate-menu"),
    --require("plugins.snacks-nvim.dashboard.items.generate-dotfyle"),
    -- Fuzzy finder
    --require("plugins.snacks-nvim.dashboard.items.hydra-fuzzy-finder"),
    -- Other menu
    require("plugins.snacks-nvim.dashboard.items.hydra-other-menu"),
    --require("plugins.snacks-nvim.dashboard.items.feed-open"),
    --require("plugins.snacks-nvim.dashboard.items.telekasten-open"),
    --require("plugins.snacks-nvim.dashboard.items.check-health"),
    -- Quit
    require("plugins.snacks-nvim.dashboard.items.quit"),
}

return keys
