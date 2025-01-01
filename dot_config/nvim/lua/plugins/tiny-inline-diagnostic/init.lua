---@type table
local cmds = {
    "TinyInlineDiagnosticEnable",
    "TinyInlineDiagnosticDisable",
    "TinyInlineDiagnosticToggle",
}

---@type LazySpec
local spec = {
    "rachartier/tiny-inline-diagnostic.nvim",
    --lazy = false,
    cmd = cmds,
    event = "LspAttach",
    priority = 1000,
    --[[
    init = function()
        vim.diagnostic.config({ virtual_text = false })
    end,
    ]]
    config = function()
        local tid = require("tiny-inline-diagnostic")
        tid.setup(require("plugins.tiny-inline-diagnostic.opts"))

        vim.api.nvim_create_user_command("TinyInlineDiagnosticEnable", function()
            tid.enable()
        end, { desc = "Enable the tiny-inline-diagnostic" })
        vim.api.nvim_create_user_command("TinyInlineDiagnosticDisable", function()
            tid.disable()
        end, { desc = "Disable the tiny-inline-diagnostic" })
        vim.api.nvim_create_user_command("TinyInlineDiagnosticToggle", function()
            tid.toggle()
        end, { desc = "Toggle the tiny-inline-diagnostic" })
    end,
    --cond = false,
    --enabled = false,
}

return spec
