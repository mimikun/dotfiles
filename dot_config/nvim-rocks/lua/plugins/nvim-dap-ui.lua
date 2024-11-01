---@type table
local opts = {
    floating = {
        border = "single",
    },
}

local dap = require("dap")
local dapui = require("dapui")

dapui.setup(opts)
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Toggle dap-ui
vim.api.nvim_create_user_command("ToggleDapUi", function()
    dapui.toggle()
end, {})
