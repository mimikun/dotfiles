-- NOTE: NEED TO SET `set -x DEVTO_API_KEY "hogehoge"`

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim", optional = true },
}

---@type LazySpec
local spec = {
    "Massolari/devto.nvim",
    --lazy = false,
    cmd = "Devto",
    dependencies = dependencies,
    cond = false,
    enabled = false,
}

return spec
