---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
}

---@type table
local opts = {
    disable_mouse = false,
    hint = true,
    notification = true,
    allow_different_key = false,
    enabled = true,
    disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
    },
}

---@type LazySpec
local spec = {
    "m4xshen/hardtime.nvim",
    --lazy = false,
    cmd = "Hardtime",
    dependencies = dependencies,
    opt = opts,
    --cond = false,
}

return spec
