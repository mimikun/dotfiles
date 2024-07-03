---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    default_remote = { "upstream", "origin" },
    default_merge_method = "rebase",
    picker = "telescope",
}

---@type LazySpec
local spec = {
    "pwntester/octo.nvim",
    --lazy = false,
    cmd = "Octo",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
