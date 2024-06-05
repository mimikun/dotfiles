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
    cmd = cmds,
    config = true,
    --cond = false,
}

return spec
