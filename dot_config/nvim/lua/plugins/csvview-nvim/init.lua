---@type table
local cmds = {
    "CsvViewEnable",
    "CsvViewDisable",
    "CsvViewToggle",
}

---@type LazySpec
local spec = {
    "hat0uma/csvview.nvim",
    --lazy = false,
    cmd = cmds,
    opts = require("plugins.csvview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
