---@type table
local dependencies = {
    "cespare/vim-toml",
    "nastevens/vim-duckscript",
}

---@type LazySpec
local spec = {
    "nastevens/vim-cargo-make",
    --lazy = false,
    --event = "VeryLazy",
    ft = "cargo-make",
    dependencies = dependencies,
    --cond = false,
}

return spec
