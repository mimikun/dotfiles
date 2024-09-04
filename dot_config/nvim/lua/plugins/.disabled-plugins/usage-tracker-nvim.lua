---@type table
local cmds = {
    "UsageTrackerShowAgg",
    "UsageTrackerShowFilesLifetime",
    "UsageTrackerShowVisitLog",
    "UsageTrackerShowDailyAggregation",
    "UsageTrackerShowDailyAggregationByFiletypes",
    "UsageTrackerShowDailyAggregationByProject",
    "UsageTrackerRemoveEntry",
    "UsageTrackerClenup",
}

---@type table
local events = {
    "BufEnter",
    "BufLeave",
    "TextChanged",
    "TextChangedI",
    "CursorMoved",
    "CursorMovedI",
}

---@type table
local opts = {
    keep_eventlog_days = 14,
    cleanup_freq_days = 7,
    event_wait_period_in_sec = 5,
    inactivity_threshold_in_min = 5,
    inactivity_check_freq_in_sec = 5,
    verbose = 0,
    telemetry_endpoint = "",
}

---@type LazySpec
local spec = {
    "gaborvecsei/usage-tracker.nvim",
    --lazy = false,
    cmd = cmds,
    event = events,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
