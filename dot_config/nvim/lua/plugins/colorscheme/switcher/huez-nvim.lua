---@type table
local opts = {
    path = vim.fs.normalize(vim.fn.stdpath("data")) .. "/huez",
    suppress_messages = true,
    exclude = require("plugins.sources.huez").exclude,
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    cmd = cmds,
    opts = opts,
    enabled = false,
    cond = false,
}

return spec
