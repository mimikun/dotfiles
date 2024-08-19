---@type table
local cmds = {
    "RustAnalyzer",
    "Rustc",
    "RustLsp",
}

---@type LazySpec
local spec = {
    "mrcjkb/rustaceanvim",
    tag = "5.1.1",
    --version = "^5",
    -- NOTE: rustaceanvim is already lazy
    lazy = false,
    cmd = cmds,
    --cond = false,
}

return spec
