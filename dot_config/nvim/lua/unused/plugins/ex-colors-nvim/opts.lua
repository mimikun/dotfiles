local path_sep = require("config.global").path_sep

---@type ExColors.Config
local opts = {
    ---@type string
    colors_dir = table.concat({ vim.fn.stdpath("config"), "colors" }, path_sep),
    ---@type string[]
    required_syntaxes = {
        "diff",
        "html",
        "markdown",
    },
}

return opts
