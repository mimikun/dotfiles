---@type LazySpec
local spec = {
    "GitMarkedDan/you-are-an-idiot.nvim",
    --lazy = false,
    cmd = "ToggleIdiot",
    config = function()
        local idiot = require("you-are-an-idiot")
        idiot.setup(require("plugins.you-are-an-idiot-nvim.opts"))

        vim.api.nvim_create_user_command("ToggleIdiot", function()
            if idiot.is_running() then
                idiot.abort()
            else
                idiot.run()
            end
        end, { desc = "Toggles YouAreAnIdiot" })
    end,
    cond = false,
    enabled = false,
}

return spec
