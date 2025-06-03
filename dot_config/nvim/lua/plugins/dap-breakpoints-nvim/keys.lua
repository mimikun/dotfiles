---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>b",
        function()
            require("dap-breakpoints.api").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
    },
    {
        "<leader>dts",
        function()
            require("dap-breakpoints.api").set_breakpoint()
        end,
        desc = "Set Breakpoint",
    },
    {
        "<leader>dtc",
        function()
            require("dap-breakpoints.api").set_conditional_breakpoint()
        end,
        desc = "Set Conditional Breakpoint",
    },
    {
        "<leader>dth",
        function()
            require("dap-breakpoints.api").set_hit_condition_breakpoint()
        end,
        desc = "Set Hit Condition Breakpoint",
    },
    {
        "<leader>dtl",
        function()
            require("dap-breakpoints.api").set_log_point()
        end,
        desc = "Set Log Point",
    },
    {
        "<leader>dtL",
        function()
            require("dap-breakpoints.api").load_breakpoints({ notify = true })
        end,
        desc = "Load Breakpoints",
    },
    {
        "<leader>dtS",
        function()
            require("dap-breakpoints.api").save_breakpoints({ notify = true })
        end,
        desc = "Save Breakpoints",
    },
    {
        "<leader>dte",
        function()
            require("dap-breakpoints.api").edit_property()
        end,
        desc = "Edit Breakpoint Property",
    },
    {
        "<leader>dtE",
        function()
            require("dap-breakpoints.api").edit_property({ all = true })
        end,
        desc = "Edit All Breakpoint Properties",
    },
    {
        "<leader>dtv",
        function()
            require("dap-breakpoints.api").toggle_virtual_text()
        end,
        desc = "Toggle Breakpoint Virtual Text",
    },
    {
        "<leader>dtC",
        function()
            require("dap-breakpoints.api").clear_all_breakpoints()
        end,
        desc = "Clear All Breakpoints",
    },
    {
        "[b",
        function()
            require("dap-breakpoints.api").go_to_previous()
        end,
        desc = "Go to Previous Breakpoint",
    },
    {
        "]b",
        function()
            require("dap-breakpoints.api").go_to_next()
        end,
        desc = "Go to Next Breakpoint",
    },
    {
        "<M-b>",
        function()
            require("dap-breakpoints.api").popup_reveal()
        end,
        desc = "Reveal Breakpoint",
    },
}

return keys
