local cmds = {
    "MastodonTootMessage",
    "MastodonAddAccount",
    "MastodonSelectAccount",
    "MastodonLoadHomeTimeline",
    "MastodonLoadBookmarks",
    "MastodonLoadFavourites",
    "MastodonLoadReplies",
    "MastodonReload",
}

return {
    "kode-team/mastodon.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "rcarriga/nvim-notify" },
        { "kkharji/sqlite.lua" },
    },
    config = function()
        require("mastodon").setup({})
    end,
    --cond = false,
}
