---@type table
local cmds = {
    "NeovimcraftPlugins",
    "NeovimcraftTags",
}

---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
}

---@type LazySpec
local spec = {
    "janwvjaarsveld/neovimcraft.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
