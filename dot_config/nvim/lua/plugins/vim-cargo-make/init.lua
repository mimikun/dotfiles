---@type LazySpec
local spec = {
    "nastevens/vim-cargo-make",
    --lazy = false,
    ft = "cargo-make",
    dependencies = require("plugins.vim-cargo-make.dependencies"),
    --cond = false,
    --enabled = false,
}

return spec
