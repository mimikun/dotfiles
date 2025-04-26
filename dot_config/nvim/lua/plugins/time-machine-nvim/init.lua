---@type LazySpec
local spec = {
    "y3owk1n/time-machine.nvim",
    --lazy = false,
    cmd = require("plugins.time-machine-nvim.cmds"),
    keys = require("plugins.time-machine-nvim.keys"),
    event = "VeryLazy",
    init = function()
        -- Enable persistent undo
        vim.opt.undofile = true
        -- Set custom undo directory
        vim.opt.undodir = vim.fn.expand("~/.undodir")
    end,
    config = function()
        local tm = require("time-machine")
        tm.setup(require("plugins.time-machine-nvim.opts"))

        -- NOTE: User commands
        -- Toggle the undotree based on current buffer.
        vim.api.nvim_create_user_command("TimeMachineToggle", function()
            tm.toggle()
        end, {})

        -- Purge the undofile for the current buffer (including tagfile).
        vim.api.nvim_create_user_command("TimeMachinePurgeBuffer", function()
            ---@type boolean Whether to force the purge
            local force = false
            tm.purge_buffer(force)
        end, {})

        -- Purge all undofiles (including tagfiles).
        vim.api.nvim_create_user_command("TimeMachinePurgeAll", function()
            ---@type boolean Whether to force the purge
            local force = false
            tm.purge_all(force)
        end, {})
    end,
    cond = false,
    enabled = false,
}

return spec
