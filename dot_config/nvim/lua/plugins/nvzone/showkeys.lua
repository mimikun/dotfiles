---@type table
local opts = {
    winopts = {
        focusable = false,
        relative = "editor",
        style = "minimal",
        border = "single",
        height = 1,
        row = 1,
        col = 0,
    },

    winhl = "FloatBorder:Comment,Normalfloat:Normal",

    timeout = 1,
    maxkeys = 5,
    show_count = false,
    excluded_modes = {}, -- example: {"i"}

    -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
    position = "bottom-right",

    keyformat = {
        ["<BS>"] = "󰁮 ",
        ["<CR>"] = "󰘌",
        ["<Space>"] = "󱁐",
        ["<Up>"] = "󰁝",
        ["<Down>"] = "󰁅",
        ["<Left>"] = "󰁍",
        ["<Right>"] = "󰁔",
        ["<PageUp>"] = "Page 󰁝",
        ["<PageDown>"] = "Page 󰁅",
        ["<M>"] = "Alt",
        ["<C>"] = "Ctrl",
    },
}

---@type LazySpec
local spec = {
    "nvzone/showkeys",
    --lazy = false,
    cmd = "ShowkeysToggle",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
