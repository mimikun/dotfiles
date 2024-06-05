-- Enable if executable csvlens command
---@type boolean
local cond = (1 == vim.fn.executable("csvlens")) and true or false

---@type table
local opts = {
    -- "float" | "vertical" | "horizontal" |  "tab"
    direction = "float",
    -- You can specify the path to the executable if you wish. Otherwise, it will use the command in the PATH.
    exec_path = "csvlens",
    -- directory to install the executable to if it's not found in the exec_path, ends with /
    -- TODO:
    exec_install_path = require("config.global").data_dir .. "/csvlens.nvim/",
}

---@type LazySpec
local spec = {
    "theKnightsOfRohan/csvlens.nvim",
    --lazy = false,
    cmd = "Csvlens",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = opts,
    cond = cond,
}

return spec
