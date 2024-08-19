---@type table
local cmds = {
    "Legendary",
    "LegendaryRepeat",
}

---@type LazySpec[]
local dependencies = {
    "kkharji/sqlite.lua",
}

---@type table
local opts = {
    select_prompt = " legendary.nvim ",
    col_separator_char = "│",
    icons = {
        command = "",
        fn = "󰡱",
        itemgroup = "",
    },
    extensions = {
        lazy_nvim = true,
        which_key = {
            auto_register = true,
        },
        nvim_tree = true,
        smart_splits = false,
        op_nvim = false,
        diffview = true,
    },
}

---@type LazySpec
local spec = {
    "mrjones2014/legendary.nvim",
    lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    priority = 10000,
}

return spec
