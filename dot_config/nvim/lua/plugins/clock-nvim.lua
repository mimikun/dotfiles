local cmds = {
    "ClockStart",
    "ClockStop",
    "ClockToggle",
}

return {
    "registerGen/clock.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = function()
        require("clock").setup({
            -- TODO: setting
            -- https://github.com/registerGen/clock.nvim/blob/master/README.md
        })
    end,
    cond = false,
}
