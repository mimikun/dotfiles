---@type table
local opts = {
    dir = "/tmp/atac",
}

---@type LazySpec
local spec = {
    "NachoNievaG/atac.nvim",
    --lazy = false,
    cmd = "Atac",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
