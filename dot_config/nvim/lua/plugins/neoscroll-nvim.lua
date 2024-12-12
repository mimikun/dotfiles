---@type table
local cmds = {
    "NeoscrollEnablePM",
    "NeoscrollEnableBufferPM",
    "NeoscrollEnableGlobalPM",
    "NeoscrollDisablePM",
    "NeoscrollDisableBufferPM",
    "NeoscrollDisableGlobalePM",
}

---@type table
local opts = {
    mappings = {},
    easing = "linear",
    performance_mode = false,
    duration_multiplier = 1.0,
    use_local_scrolloff = false,
}

---@type LazySpec
local spec = {
    "karb94/neoscroll.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufRead",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
