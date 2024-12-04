---@type table
local cmds = {
    "NeoscrollEnablePM",
    "NeoscrollEnableBufferPM",
    "NeoscrollEnableGlobalPM",
    "NeoscrollDisablePM",
    "NeoscrollDisableBufferPM",
    "NeoscrollDisableGlobalePM",
    -- BUG: has typo
    --"NeoscrollDisablGlobalePM",
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
    config = function()
        require("neoscroll").setup(opts)

        -- WORKAROUND: typo
        vim.api.nvim_create_user_command("NeoscrollDisableGlobalePM", function()
            vim.g.neoscroll_performance_mode = false
        end, {})
        vim.api.nvim_del_user_command("NeoscrollDisablGlobalePM")
    end,
    -- TODO: NOW fixing scroll speed
    --cond = false,
    --enabled = false,
}

return spec
