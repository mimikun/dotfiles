-- Enable if executable csvlens command
---@type boolean
local has_csvlens = (1 == vim.fn.executable("csvlens")) and true or false
---@type boolean
local cond = has_csvlens

---@type LazySpec
local spec = {
    "theKnightsOfRohan/csvlens.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Csvlens",
    dependencies = {
        "akinsho/toggleterm.nvim",
    },
    opts = {
        -- "float" | "vertical" | "horizontal" |  "tab"
        direction = "float",
        -- You can specify the path to the executable if you wish. Otherwise, it will use the command in the PATH.
        exec_path = "csvlens",
        -- directory to install the executable to if it's not found in the exec_path, ends with /
        exec_install_path = vim.fn.stdpath("data") .. "/csvlens.nvim/",
    },
    cond = cond,
}

return spec
