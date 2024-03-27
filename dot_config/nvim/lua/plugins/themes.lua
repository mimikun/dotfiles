local themery_config = require("core.global").themery_config

---@type LazySpec
local github_theme = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    --event = "VeryLazy",
    priority = 1000,
    --cond = false,
}

---@type LazySpec
local cyberdream = {
    "scottmckendry/cyberdream.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    opts = {
        -- Enable transparent background
        transparent = true,
        -- Enable italics comments
        italic_comments = true,
        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = true,
        -- Modern borderless telescope theme
        borderless_telescope = true,
    },
    --cond = false,
}

---@type LazySpec
local monokai = {
    "tanvirtin/monokai.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local penumbra = {
    "Allianaab2m/penumbra.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local tokyonight = {
    "folke/tokyonight.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    opts = {},
    --cond = false,
}

---@type LazySpec
local yash = {
    "kihachi2000/yash.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local nightfox = {
    "EdenEast/nightfox.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local tokyodark = {
    "tiagovla/tokyodark.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local monokai_pro = {
    "loctvl842/monokai-pro.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local nord = {
    "shaunsingh/nord.nvim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    --event = "VeryLazy",
    priority = 1000,
    config = true,
    --cond = false,
}

---@type LazySpec
local pastelnight = {
    "pauchiner/pastelnight.nvim",
    --lazy = false,
    --event = "VeryLazy",
    priority = 1000,
    opts = {},
    --cond = false,
}

---@type LazySpec
local kurayami = {
    "kevinm6/kurayami.nvim",
    --lazy = false,
    --event = "VimEnter",
    priority = 1000,
    --cond = false,
}

---@type LazySpec
local lavi = {
    "b0o/lavi.nvim",
    --lazy = false,
    --event = "VimEnter",
    dependencies = { "rktjmp/lush.nvim" },
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local evergarden = {
    "comfysage/evergarden",
    --lazy = false,
    --event = "VimEnter",
    opts = {
        transparent_background = true,
        -- 'hard'|'medium'|'soft'
        contrast_dark = "medium",
        -- add custom overrides
        overrides = {},
    },
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local sunburn = {
    "loganswartz/sunburn.nvim",
    --lazy = false,
    --event = "VimEnter",
    dependencies = { "loganswartz/polychrome.nvim" },
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local sonokai = {
    "sainnhe/sonokai",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = function()
        vim.g.sonokai_style = "default"
    end,
    --cond = false,
}

---@type LazySpec
local kyotonight = {
    "voidekh/kyotonight.vim",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local momiji = {
    "kyoh86/momiji",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    --cond = false,
}

---@type LazySpec
local edge = {
    "sainnhe/edge",
    --lazy = false,
    --event = "VeryLazy",
    --priority = 1000,
    config = function()
        vim.g.edge_style = "default"
        vim.g.edge_better_performance = 1
    end,
    --cond = false,
}

---@type LazySpec[]
local theme_specs = {
    -- Lua themes
    github_theme,
    cyberdream,
    monokai,
    penumbra,
    tokyonight,
    yash,
    nightfox,
    tokyodark,
    monokai_pro,
    nord,
    catppuccin,
    pastelnight,
    kurayami,
    lavi,
    evergarden,
    sunburn,
    -- VimScript themes
    sonokai,
    kyotonight,
    momiji,
    edge,
}

---@type table
local huez_omit_themes = {
    "default",
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
}

---@type LazySpec
local huez = {
    "vague2k/huez.nvim",
    --lazy = false,
    cmd = "Huez",
    --event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local huez = require("huez")
        local huez_api = require("huez.api")

        huez.setup({
            file_path = vim.fs.normalize(vim.fn.stdpath("config")) .. "/.nvim.huez.lua",
            fallback = "default",
            omit = huez_omit_themes,
            -- "vim" or "telescope"
            picker = "telescope",
            picker_opts = require("telescope.themes").get_dropdown({}),
        })
        local colorscheme = huez_api.get_colorscheme()
        vim.cmd.colorscheme(colorscheme)
    end,
    cond = false,
}

---@type table
local themery_selectables = {
    {
        name = "github_dark",
        colorscheme = "github_dark",
    },
    {
        name = "cyberdream",
        colorscheme = "cyberdream",
    },
    {
        name = "monokai",
        colorscheme = "monokai",
    },
    {
        name = "penumbra",
        colorscheme = "penumbra",
    },
    {
        name = "tokyonight",
        colorscheme = "tokyonight",
    },
    {
        name = "yash",
        colorscheme = "yash",
    },
    {
        name = "nightfox",
        colorscheme = "nightfox",
    },
    {
        name = "tokyodark",
        colorscheme = "tokyodark",
    },
    {
        name = "monokai_pro",
        colorscheme = "monokai-pro",
    },
    {
        name = "nord",
        colorscheme = "nord",
    },
    {
        name = "catppuccin",
        colorscheme = "catppuccin",
    },
    {
        name = "pastelnight",
        colorscheme = "pastelnight",
    },
    {
        name = "kurayami",
        colorscheme = "kurayami",
    },
    {
        name = "lavi",
        colorscheme = "lavi",
    },
    -- TODO: evergarden_2
    {
        name = "",
        colorscheme = "",
    },
    {
        name = "sunburn",
        colorscheme = "sunburn",
    },
    {
        name = "sonokai",
        colorscheme = "sonokai",
    },
    {
        name = "kyotonight",
        colorscheme = "kyotonight",
    },
    {
        name = "momiji",
        colorscheme = "momiji",
    },
    {
        name = "edge",
        colorscheme = "edge",
    },
}

local themery = {
    "zaldih/themery.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Themery",
    opts = {
        themes = themery_selectables,
        themeConfigFile = themery_config,
        livePreview = true,
    },
    --cond = false,
}

---@type LazySpec[]
local specs = {
    --github_theme,
    theme_specs,
    huez,
    themery,
}

return specs
