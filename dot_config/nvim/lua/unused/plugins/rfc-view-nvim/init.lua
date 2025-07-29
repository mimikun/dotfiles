---@type LazySpec
local spec = {
    "neet-007/rfc-view.nvim",
    --lazy = false,
    build = "cd go && go build main.go",
    branch = "master",
    keys = require("plugins.rfc-view-nvim.keys"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
