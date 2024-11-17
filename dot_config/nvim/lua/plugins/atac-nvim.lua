--- enabled check
---@return boolean
local enabled = function()
    local has_atac = (1 == vim.fn.executable("atac")) and true or false
    return has_atac
end

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
    cond = enabled,
    enabled = enabled,
}

return spec
