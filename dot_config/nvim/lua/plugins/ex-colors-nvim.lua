---@type ExColors.Config
local opts = {
    ---@type string
    colors_dir = table.concat({ vim.fn.stdpath("config"), "colors" }, require("config.global").path_sep),
    ---@type string[]
    required_syntaxes = {
        "diff",
        "html",
        "markdown",
    },
}

---@type LazySpec
local spec = {
    "aileot/ex-colors.nvim",
    --lazy = false,
    cmd = "ExColors",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
