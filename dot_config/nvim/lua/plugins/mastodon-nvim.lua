return {
    "kode-team/mastodon.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "rcarriga/nvim-notify" },
        { "kkharji/sqlite.lua" },
    },
    cmd = {
        "MastodonTootMessage",
        "MastodonAddAccount",
        "MastodonSelectAccount",
        "MastodonLoadHomeTimeline",
        "MastodonLoadBookmarks",
        "MastodonLoadFavourites",
        "MastodonLoadReplies",
        "MastodonReload",
    },
    config = function()
        require("mastodon").setup({})
    end,
    --cond = false,
}
