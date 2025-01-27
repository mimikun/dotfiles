---@type LazySpec
local spec = {
    "mfussenegger/nvim-dap",
    --lazy = false,
    config = function()
        --[[
        local dap = require("dap")
        local dapui = require("dapui")
        local dapview = require("dap-view")
        local dlb = dap.listeners.before

        dlb.attach.dapui_config = function()
            dapui.open()
        end
        dlb.launch.dapui_config = function()
            dapui.open()
        end
        dlb.event_terminated.dapui_config = function()
            dapui.close()
        end
        dlb.event_exited.dapui_config = function()
            dapui.close()
        end

        dlb.attach.dapview_config = function()
            dapview.open()
        end
        dlb.launch.dapview_config = function()
            dapui.open()
        end
        dlb.event_terminated.dapview_config = function()
            dapui.close()
        end
        dlb.event_exited.dapview_config = function()
            dapui.close()
        end
        ]]
    end,
    --cond = false,
    --enabled = false,
}

return spec
