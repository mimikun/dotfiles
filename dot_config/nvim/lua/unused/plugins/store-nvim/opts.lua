---@type table
local opts = {
    -- Window dimensions (percentages or absolute)
    width = 0.8,
    height = 0.8,

    -- Layout proportions (must sum to 1.0)
    proportions = {
        list = 0.3, -- 30% for repository list
        preview = 0.7, -- 70% for preview pane
    },

    -- Repository display options
    list_fields = { "full_name", "pushed_at", "stars", "forks", "issues", "tags" },
    full_name_limit = 35, -- Max characters for repository names

    -- GitHub API (optional)
    github_token = nil, -- GitHub token for increased rate limits

    -- Behavior
    preview_debounce = 100, -- ms delay for preview updates
    cache_duration = 24 * 60 * 60, -- 24 hours in seconds
    logging = "off", -- Levels: off, error, warn, log, debug
}

return opts
