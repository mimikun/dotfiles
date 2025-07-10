---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tl",
        function()
            require("quicktest").run_line()
        end,
        desc = "[T]est Run [L]line",
    },
    {
        "<leader>tf",
        function()
            require("quicktest").run_file()
        end,
        desc = "[T]est Run [F]ile",
    },
    {
        "<leader>td",
        function()
            require("quicktest").run_dir()
        end,
        desc = "[T]est Run [D]ir",
    },
    {
        "<leader>ta",
        function()
            require("quicktest").run_all()
        end,
        desc = "[T]est Run [A]ll",
    },
    {
        "<leader>tp",
        function()
            require("quicktest").run_previous()
        end,
        desc = "[T]est Run [P]revious",
    },
    {
        "<leader>tt",
        function()
            require("quicktest").toggle_win("split")
        end,
        desc = "[T]est [T]oggle Window",
    },
    {
        "<leader>tc",
        function()
            require("quicktest").cancel_current_run()
        end,
        desc = "[T]est [C]ancel Current Run",
    },
}

return keys
