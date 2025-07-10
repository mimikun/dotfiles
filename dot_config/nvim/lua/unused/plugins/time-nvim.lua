---@type table
local cmds = {
    "TimeWatch",
    "TimeWatchS",
}

---@type table
local opts = {
    -- 300000ms (5min)
    inactive_timeout = 300000,
    verbose = true,
    update_on_move = true,
}

---@type LazySpec
local spec = {
    "leonardo-luz/time.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
