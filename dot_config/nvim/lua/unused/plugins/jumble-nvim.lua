---@type table
local opts = {
    -- every day
    days = 1,
    themes = {
        "tokyonight",
        "github_dark",
        "pastelnight",
    },
}

---@type LazySpec
local dependencies = {
    { import = "colorschemes" },
}

---@type LazySpec
local spec = {
    "LinkUpGames/jumble.nvim",
    --lazy = false,
    cmd = "Jumble",
    dependencies = dependencies,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
