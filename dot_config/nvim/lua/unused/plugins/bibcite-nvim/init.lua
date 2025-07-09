-- use check: xdg-open or open (for opening external files)

---@type LazySpec
local spec = {
    "aidavdw/bibcite.nvim",
    --lazy = false,
    cmd = require("plugins.bibcite-nvim.cmds"),
    keys = require("plugins.bibcite-nvim.keys"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.bibcite-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
