---@type LazySpec
local dependencies = {
    -- TODO:
}

---@type LazySpec
local spec = {
    "LmanTW/themify.nvim",
    lazy = false,
    cmd = "Themify",
    dependencies = dependencies,
    config = function()
        require("themify").setup(
            require("plugins.configs.themify-nvim.opts")
        )
    end,
    priority = 999,
    cond = false,
    enabled = false,
}

return spec
