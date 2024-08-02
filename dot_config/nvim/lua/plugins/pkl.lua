---@type table
local events = {
    "BufReadPre *.pkl",
    "BufReadPre *.pcf",
    "BufReadPre PklProject",
}

---@type function
local build = function()
    vim.cmd("TSInstall! pkl")
end

---@type LazySpec
local spec = {
    "apple/pkl-neovim",
    --build = build,
    --lazy = false,
    event = events,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    --cond = false,
}

return spec
