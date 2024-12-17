---@type table
local cmds = {
    "RustAnalyzer",
    "Rustc",
    "RustLsp",
}

---@type LazySpec
local spec = {
    "mrcjkb/rustaceanvim",
    version = "^5",
    -- NOTE: rustaceanvim is already lazy
    lazy = false,
    cmd = cmds,
    --cond = false,
    --enabled = false,
}

return spec
