---@type boolean
local cond = not require("config.global").is_windows

---@type table
local cmds = {
    "ApidocsInstall",
    "ApidocsOpen",
    "ApidocsSearch",
    "ApidocsSelect",
    "ApidocsUninstall",
}

---@type LazySpec
local spec = {
    "emmanueltouzery/apidocs.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
