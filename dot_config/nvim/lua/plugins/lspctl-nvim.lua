---@type table
local opts = {
    info = "h",
    start = "s",
    stop = "x",
    restart = "r",
    close = "q",
}

---@type LazySpec
local spec = {
    "clxmochamalefic/lspctl.nvim",
    --lazy = false,
    cmd = "Lspctl",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = opts,
    -- BUG: can't install now
    cond = false,
    enabled = false,
}

return spec
