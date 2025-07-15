---@class patchr.config
local opts = {
    autocmds = false,
    plugins = {},
    ---@class patchr.config.git
    git = {
        ---@class patchr.config.git.reset
        reset = {
            hard = true,
        },
    },
}

---@type LazySpec
local spec = {
    "nhu/patchr.nvim",
    --lazy = false,
    cmd = "Patchr",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
