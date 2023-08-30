return {
    "dinhhuy258/git.nvim",
    cmd = {
        "Git",
        "GitBlame",
        "GitDiff",
        "GitDiffClose",
        "GitCreatePullRequest",
        "GitCreatePullRequest",
        "GitRevert",
        "GitRevertFile",
    },
    config = function()
        require("git").setup({})
    end,
    --cond = false,
}
