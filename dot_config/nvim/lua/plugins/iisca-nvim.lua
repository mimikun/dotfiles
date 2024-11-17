--- enabled check
---@return boolean
local enabled = function()
    local has_tiv = (1 == vim.fn.executable("tiv")) and true or false
    return has_tiv
end

---@type LazySpec
local spec = {
    "Abizrh/iisca.nvim",
    --lazy = false,
    cmd = "ShowIisca",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = enabled,
    enabled = enabled,
}

return spec
