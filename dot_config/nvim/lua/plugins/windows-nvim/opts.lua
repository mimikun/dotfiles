---@type table
local opts = {
    ignore = {
        buftype = {
            "quickfix",
        },
        filetype = {
            "NvimTree",
            "neo-tree",
            "undotree",
            "gundo",
        },
    },
    animation = {
        enable = true,
        duration = 300,
        fps = 30,
        easing = "in_out_sine",
    },
}

return opts
