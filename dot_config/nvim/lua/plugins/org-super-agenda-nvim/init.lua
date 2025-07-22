---@type LazySpec
local spec = {
    "hamidi-dev/org-super-agenda.nvim",
    --lazy = false,
    cmd = "OrgSuperAgenda",
    dependencies = require("plugins.org-super-agenda-nvim.dependencies"),
    opts = require("plugins.org-super-agenda-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
