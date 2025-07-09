-- TODO: Enable it only on specific machines
---@type boolean
local cond = false

---@type LazySpec
local spec = {
    "Davidyz/VectorCode",
    --lazy = false,
    build = "pipx upgrade vectorcode",
    version = "*",
    cmd = "VectorCode",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
