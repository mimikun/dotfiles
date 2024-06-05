---@type table
local cmds = {
    "Git",
    "GitBlame",
    "GitDiff",
    "GitDiffClose",
    "GitCreatePullRequest",
    "GitCreatePullRequest",
    "GitRevert",
    "GitRevertFile",
}

---@type LazySpec
local spec = {
    "dinhhuy258/git.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = true,
    --cond = false,
}

return spec
