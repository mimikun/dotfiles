---@type table
local cmds = {
    "HlArgsToggle",
    "HlArgsEnable",
    "HlArgsDisable",
}

---@type LazySpec
local spec = {
    "m-demare/hlargs.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    config = function()
        local hlargs = require("hlargs")
        hlargs.setup(require("plugins.hlargs-nvim.opts"))

        vim.api.nvim_create_user_command("HlArgsToggle", function()
            hlargs.toggle()
        end, { desc = "Toggle hlargs" })
        vim.api.nvim_create_user_command("HlArgsEnable", function()
            hlargs.enable()
        end, { desc = "Enable hlargs" })
        vim.api.nvim_create_user_command("HlArgsDisable", function()
            hlargs.disable()
        end, { desc = "Disable hlargs" })
    end,
    --cond = false,
    --enabled = false,
}

return spec
