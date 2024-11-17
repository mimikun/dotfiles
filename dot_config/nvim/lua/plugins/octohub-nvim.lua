---@type LazySpec
local dependencies = {
    "2kabhishek/utils.nvim",
    "nvim-telescope/telescope.nvim",
}

---@type LazySpec
local spec = {
    "2kabhishek/octohub.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
