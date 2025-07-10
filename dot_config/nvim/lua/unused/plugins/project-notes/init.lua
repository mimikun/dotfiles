---@type LazySpec
local spec = {
    url = "https://codeberg.org/ravnheim/project_notes",
    name = "project_notes",
    --lazy = false,
    cmd = require("plugins.project-notes.cmds"),
    keys = require("plugins.project-notes.keys"),
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.project-notes.opts"),
    cond = false,
    enabled = false,
}

return spec
