---@type LazySpec
local spec = {
    "saecki/crates.nvim",
    --lazy = false,
    cmd = "Crates",
    event = { "BufRead Cargo.toml" },
    opts = require("plugins.crates-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
