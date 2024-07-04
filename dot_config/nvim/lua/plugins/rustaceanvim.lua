---@type table
local cmds = {
    "Rustc",
    "RustLsp",
    "RustAnalyzer",
    "Rustc",
}

---@type LazySpec
local spec = {
    "mrcjkb/rustaceanvim",
    version = "^4",
    -- NOTE: rustaceanvim is already lazy
    lazy = false,
    --cmd = cmds,
    --cond = false,
}

return spec
