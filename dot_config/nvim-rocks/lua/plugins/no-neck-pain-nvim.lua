---@type table
local opts = {
    integrations = {
        --- @type table
        NvimTree = {
            -- The position of the tree.
            --- @type "left"|"right"
            position = "left",
        },
    },
}

require("no-neck-pain").setup(opts)
