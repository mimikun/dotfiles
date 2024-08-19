---@type LazySpec
local spec = {
    "saecki/crates.nvim",
    --lazy = false,
    cmd = "Crates",
    event = { "BufRead Cargo.toml" },
    opts = require("plugins.configs.crates-nvim.opts"),
    --cond = false,
}

return spec
