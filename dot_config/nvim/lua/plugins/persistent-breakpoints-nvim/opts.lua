---@type table
local opts = {
    save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
    load_breakpoints_event = { "BufReadPost" },
    -- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
    perf_record = false,
    -- perform callback when loading a persisted breakpoint
    --- @param opts DAPBreakpointOptions options used to create the breakpoint ({condition, logMessage, hitCondition})
    --- @param buf_id integer the buffer the breakpoint was set on
    --- @param line integer the line the breakpoint was set on
    on_load_breakpoint = nil,
    -- set this to true if the breakpoints are not loaded when you are using a session-like plugin.
    always_reload = false,
}

return opts
