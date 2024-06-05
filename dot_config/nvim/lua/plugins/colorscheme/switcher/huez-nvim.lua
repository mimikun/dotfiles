---@type table
local huez_exclude_themes = {
    "desert",
    "evening",
    "industry",
    "koehler",
    "morning",
    "murphy",
    "pablo",
    "peachpuff",
    "ron",
    "shine",
    "slate",
    "torte",
    "zellner",
    "blue",
    "darkblue",
    "delek",
    "quiet",
    "elflord",
    "habamax",
    "lunaperche",
    "zaibatsu",
    "wildcharm",
    "sorbet",
    "vim",
}

---@type table
local opts = {
    path = vim.fs.normalize(vim.fn.stdpath("data")) .. "/huez",
    fallback = "default",
    exclude = huez_exclude_themes,
    picker = {
        themes = {
            layout = "right",
            opts = {},
        },
        favorites = {
            layout = "right",
            opts = {},
        },
        live = {
            layout = "right",
            opts = {},
        },
        ensured = {
            layout = "right",
            opts = {},
        },
    },
}

---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    lazy = false,
    cmd = cmds,
    opts = opts,
}

return spec
