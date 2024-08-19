---@type table
local cmds = {
    "FlagToggle",
    "FlagActivate",
    "FlagDeactivate",
}

---@type LazySpec
local spec = {
    "prichrd/flagmode.nvim",
    --lazy = false,
    cmd = cmds,
    config = function()
        local flagmode = require("flagmode")

        flagmode.register("relative_number", {
            activate = function()
                vim.opt.relativenumber = true
            end,
            deactivate = function()
                vim.opt.relativenumber = false
            end,
        })
    end,
    --cond = false,
}

return spec
