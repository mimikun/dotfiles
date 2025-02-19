---@type feed.feed[]
local feeds = {
    -- GitHub Lua Trend
    {
        "https://mshibanami.github.io/GitHubTrendingRSS/daily/lua.xml",
        name = "GitHub Lua Trend",
        tags = { "tech", "lua", "neovim" },
    },
    -- GitHub Rust Trend
    {
        "https://mshibanami.github.io/GitHubTrendingRSS/daily/rust.xml",
        name = "GitHub Rust Trend",
        tags = { "tech", "rust", "neovim" },
    },
    -- zenn.dev
    {
        "https://zenn.dev/feed",
        name = "Zenn.dev",
        tags = { "tech", "article" },
    },
    -- vim ekiden
    {
        "https://vim-jp.org/ekiden/rss",
        name = "Vim Ekiden",
        tags = { "tech", "article", "vim", "neovim" },
    },
    -- hatebu hotentry
    {
        "https://b.hatena.ne.jp/hotentry/it.rss",
        name = "Hatebu hotentry",
        tags = { "tech", "article" },
    },
    -- dotfyle new plugins
    {
        "https://dotfyle.com/neovim/plugins/rss.xml",
        name = "dotfyle - new plugins",
        tags = { "tech", "neovim" },
    },
    -- yutkat's neovim plugin list
    {
        "https://github.com/yutkat/my-neovim-pluginlist/commits/main.atom",
        name = "yutkat's neovim plugin list",
        tags = { "tech", "neovim" },
    },
    -- dotfyle TWiN
    {
        "https://dotfyle.com/this-week-in-neovim/rss.xml",
        name = "dotfyle - TWiN",
        tags = { "tech", "article", "neovim" },
    },
    -- terminaltrove
    {
        "https://terminaltrove.com/new.xml",
        name = "terminaltrove",
        tags = { "tech", "tool" },
    },
    -- console.dev
    {
        "https://console.dev/tools/rss.xml",
        name = "console.dev",
        tags = { "tech", "tool" },
    },
    -- neovim sub-reddit
    {
        "https://www.reddit.com/r/neovim.rss",
        name = "neovim sub-reddit",
        tags = { "tech", "neovim" },
    },
    -- tadashi-aikawa - Bluesky
    {
        "https://bsky.app/profile/did:plc:bi2l5vkitdtgw364ixidbint/rss",
        name = "tadashi-aikawa - Bluesky",
        tags = { "sns" },
    },
}

return feeds
