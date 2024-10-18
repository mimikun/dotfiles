---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>goa",
        ":OctoActivityStats<CR>",
        desc = "Activity Stats",
    },
    {
        "<leader>goc",
        "OctoRepo<CR>",
        desc = "Open / Clone Repo",
    },
    {
        "<leader>gof",
        ":OctoRepos type:fork<CR>",
        desc = "Forked Repos",
    },
    {
        "<leader>gog",
        ":OctoContributionStats<CR>",
        desc = "Contribution Graph",
    },
    {
        "<leader>goh",
        desc = "unknown",
    },
    {
        "<leader>goi",
        ":OctoRepos sort:issues<CR>",
        desc = "Repos With Issues",
    },
    {
        "<leader>goo",
        ":OctoRepos<CR>",
        desc = "All Repos",
    },
    --[[
    {
        "<leader>gop",
        ":OctoProfile<CR>",
        desc = "Open GitHub Profile",
    },
    ]]
    {
        "<leader>gop",
        ":OctoRepos type:private<CR>",
        desc = "Private Repos",
    },
    {
        "<leader>gor",
        ":OctoRepoStats<CR>",
        desc = "Repo Stats",
    },
    {
        "<leader>gos",
        ":OctoRepos sort:stars<CR>",
        desc = "Top Starred Repos",
    },
    {
        "<leader>got",
        ":OctoStats<CR>",
        desc = "All Stats",
    },
    {
        "<leader>gou",
        ":OctoRepos sort:updated<CR>",
        desc = "Recently Updated Repos",
    },
    {
        "<leader>gow",
        ":OctoRepoWeb<CR>",
        desc = "Open Repo in Browser",
    },
}

return keys
