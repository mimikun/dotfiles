---@type LazySpec
local spec = {
    "pmouraguedes/sql-ghosty.nvim",
    --lazy = false,
    cmd = "SqlInlayHintsToggle",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { show_hints_by_default = true },
    cond = false,
    enabled = false,
}

return spec
