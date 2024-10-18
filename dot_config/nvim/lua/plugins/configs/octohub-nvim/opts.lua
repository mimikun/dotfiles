---@type table
local opts = {
    -- Icons for different contribution levels
    contrib_icons = { "", "", "", "", "", "", "" },
    -- Directory where repositories are cloned
    projects_dir = "~/Projects/",
    -- Create a directory for each user
    per_user_dir = true,
    -- Sort repositories by various parameters
    -- Available options: `stars`, `forks`, `updated`, `created`, `pushed`, `name`, `size`, `watchers`, `issues`
    sort_repos_by = "",
    -- Type of repositories to display
    -- Available options: `private`, `fork`, `template`, `archived`
    repo_type = "",
    -- Max number of contributions per day to use for icon selection
    max_contributions = 50,
    -- Number of top languages to display in stats
    top_lang_count = 5,
    -- Number of activity events to show
    event_count = 5,
    -- Width in percentage of the window to display stats
    window_width = 90,
    -- Height in percentage of the window to display stats
    window_height = 60,
    -- Show recent activity in the stats window
    show_recent_activity = true,
    -- Show contributions in the stats window
    show_contributions = true,
    -- Show repository stats in the stats window
    show_repo_stats = true,
    -- Time in seconds to cache repositories
    repo_cache_timeout = 3600 * 24,
    -- Time in seconds to cache username
    username_cache_timeout = 3600 * 24 * 7,
    -- Cache timeout for activity events (30 minutes)
    events_cache_timeout = 60 * 30,
    -- Cache timeout for contributions data (4 hours)
    contributions_cache_timeout = 3600 * 4,
    -- Cache timeout for user data (7 days)
    user_cache_timeout = 3600 * 24 * 7,
    -- Add default keybindings for the plugin
    add_default_keybindings = true,
}

return opts
