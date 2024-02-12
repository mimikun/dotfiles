-- Enable if executable csvlens command
local has_csvlens = (1 == vim.fn.executable("csvlens")) and true or false
local cond = has_csvlens

return {
    "theKnightsOfRohan/csvlens.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Csvlens",
    dependencies = {
        "akinsho/toggleterm.nvim",
    },
    config = function()
        require("csvlens"):setup({
            -- "float" | "vertical" | "horizontal" |  "tab"
            direction = "float",
            -- You can specify the path to the executable if you wish. Otherwise, it will use the command in the PATH.
            exec_path = "csvlens",
            -- directory to install the executable to if it's not found in the exec_path, ends with /
            exec_install_path = vim.fn.stdpath("data") .. "/csvlens.nvim/",
        })
    end,
    cond = cond,
}
