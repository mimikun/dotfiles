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

return {
    "dinhhuy258/git.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    config = function()
        require("git").setup({})
    end,
    --cond = false,
}
