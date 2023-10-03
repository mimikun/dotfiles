local cmds = {
    "LiveServerStart",
    "LiveServerStop",
}

return {
    "barrett-ruth/live-server.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = function()
        require("live-server").setup({})
    end,
    --cond = false,
}
