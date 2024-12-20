local ext = {
    auto_validate = true,
    db_root = vim.fn.stdpath("state"),
    db_safe_mode = true,
    db_validate_threshold = 10,
    default_workspace = nil,
    disable_devicons = false,
    hide_current_buffer = false,
    --filter_delimiter = nil,
    --[[
        --ignore_patterns = nil
            Default:
              for non-Windows: `{ "*.git/*", "*/tmp/*", "term://*" }`
              for Windows: `{ [[*.git\*] ], [ [*\tmp\*] ], "term://*" }`
            Type: `string`
        ]]
    matcher = "fuzzy",
    max_timestamps = 10,
    path_display = { "filename_first" },
    recency_values = {
        -- past 4 hours
        { age = 240, value = 100 },
        -- past day
        { age = 1440, value = 80 },
        -- past 3 days
        { age = 4320, value = 60 },
        -- past week
        { age = 10080, value = 40 },
        -- past month
        { age = 43200, value = 20 },
        -- past 90 days
        { age = 129600, value = 10 },
    },
    scoring_function = function(recency, fzy_score)
        local score = (10 / (recency == 0 and 1 or recency)) - 1 / fzy_score
        return score == -1 and -1.000001 or score
    end,
    show_filter_column = true,
    show_scores = false,
    show_unindexed = true,
    workspace_scan_cmd = nil,
    workspaces = {},
}

return ext
