---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>goo",
        "<cmd>OctoRepos<CR>",
        mode = "n",
        desc = "All Repos",
    },
    {
        "<leader>gos",
        "<cmd>OctoRepos sort:stars<CR>",
        mode = "n",
        desc = "Top Starred Repos",
    },
    {
        "<leader>goi",
        "<cmd>OctoRepos sort:issues<CR>",
        desc = "Repos With Issues",
        mode = "n",
    },
    {
        "<leader>gou",
        "<cmd>OctoRepos sort:updated<CR>",
        mode = "n",
        desc = "Recently Updated Repos",
    },
    {
        "<leader>gop",
        "<cmd>OctoRepos type:private<CR>",
        desc = "Private Repos",
        mode = "n",
    },
    {
        "<leader>gof",
        "<cmd>OctoRepos type:fork<CR>",
        desc = "Forked Repos",
        mode = "n",
    },
    {
        "<leader>goc",
        "<cmd>OctoRepo<CR>",
        desc = "Open / Clone Repo",
        mode = "n",
    },
    {
        "<leader>got",
        "<cmd>OctoStats<CR>",
        desc = "All Stats",
        mode = "n",
    },
    {
        "<leader>goa",
        "<cmd>OctoActivityStats<CR>",
        desc = "Activity Stats",
        mode = "n",
    },
    {
        "<leader>gog",
        "<cmd>OctoContributionStats<CR>",
        desc = "Contribution Graph",
        mode = "n",
    },
    {
        "<leader>gor",
        "<cmd>OctoRepoStats<CR>",
        desc = "Repo Stats",
        mode = "n",
    },
    {
        "<leader>gop",
        "<cmd>OctoProfile<CR>",
        desc = "Open GitHub Profile",
        mode = "n",
    },
    {
        "<leader>gow",
        "<cmd>OctoRepoWeb<CR>",
        desc = "Open Repo in Browser",
        mode = "n",
    },
}

return keys
