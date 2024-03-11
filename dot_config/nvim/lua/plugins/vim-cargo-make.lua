---@type LazySpec
local spec = {
    "nastevens/vim-cargo-make",
    --lazy = false,
    --event = "VeryLazy",
    ft = "cargo-make",
    dependencies = {
        "cespare/vim-toml",
        "nastevens/vim-duckscript",
    },
    --cond = false,
}

return spec
