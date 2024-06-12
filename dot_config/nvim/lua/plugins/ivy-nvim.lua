---@type boolean
local enabled = not require("core.global").is_windows

---@type table
local keys = {
    { "<leader>p", desc = "Find files in your project with a custom rust file finder" },
    { "<leader>/", desc = "Find content in files using the silver searcher" },
    { "<leader>b", desc = "Search though open buffers" },
}

---@type table
local cmds = {
    "IvyFd",
    "IvyAg",
    "IvyBuffers",
    "IvyLines",
    "IvyWorkspaceSymbol",
}

---@type LazySpec
local spec = {
    "AdeAttwood/ivy.nvim",
    lazy = false,
    enabled = enabled,
    build = "cargo build --release",
    cmd = cmds,
    keys = keys,
    --cond = false,
}

return spec
