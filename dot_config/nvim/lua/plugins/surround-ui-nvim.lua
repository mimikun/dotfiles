---@type table
local dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
}

---@type table
local opts = {
    root_key = "S",
}

---@type LazySpec
local spec = {
    "roobert/surround-ui.nvim",
    --lazy = false,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
