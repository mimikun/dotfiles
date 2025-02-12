---@type LazySpec
local spec = {
    "alonswartz/notesium",
    --lazy = false,
    cmd = require("plugins.notesium.cmds"),
    keys = require("plugins.notesium.keys"),
    init = function()
        -- Binary name or path
        vim.g.notesium_bin = "notesium"
        -- Enable(1) or disable(0) mappings
        vim.g.notesium_mappings = 1
        -- First day of the week
        vim.g.notesium_weekstart = "monday"
        -- Finder Default
        vim.g.notesium_window = {
            width = 0.85,
            height = 0.85,
        }
        -- Finder InsertLink
        vim.g.notesium_window_small = {
            width = 0.50,
            height = 0.50,
        }
    end,
    --cond = false,
    --enabled = false,
}

return spec
