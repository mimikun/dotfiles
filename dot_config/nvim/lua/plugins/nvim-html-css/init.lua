-- TODO: nvim-cmp Integration
--{ name = "html-css" } add source

---@type LazySpec
local spec = {
    "Jezda1337/nvim-html-css",
    --lazy = false,
    dependencies = require("plugins.nvim-html-css.dependencies"),
    opts = require("plugins.nvim-html-css.opts"),
    --cond = false,
    --enabled = false,
}

return spec
