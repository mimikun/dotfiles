----------------
-- Lua Themes --
----------------

---@type LazySpec
local github_theme = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    config = function()
        require("github-theme").setup({
            options = {
                transparent = vim.g.transparent_enabled,
            },
        })
    end,
    --cond = false,
}

---@type LazySpec
local cyberdream = {
    "scottmckendry/cyberdream.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
    },
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local monokai = {
    "tanvirtin/monokai.nvim",
    --lazy = false,
    config = true,
    --cond = false,
}

---@type LazySpec
local penumbra = {
    "Allianaab2m/penumbra.nvim",
    --lazy = false,
    opts = {
        italic_comment = false,
        transparent_bg = vim.g.transparent_enabled,
        show_end_of_buffer = false,
        light = false,
        contrast = nil,
        --contrast = "plus",
        --contrast = "plusplus",
    },
    config = true,
    --cond = false,
}

---@type LazySpec
local tokyonight = {
    "folke/tokyonight.nvim",
    --lazy = false,
    opts = {
        style = "storm",
        --style = "moon",
        --style = "night",
        --style = "day",
        light_style = "day",
        transparent = vim.g.transparent_enabled,
        terminal_colors = true,
    },
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local yash = {
    "kihachi2000/yash.nvim",
    --lazy = false,
    --cond = false,
}

---@type LazySpec
local nightfox = {
    "EdenEast/nightfox.nvim",
    --lazy = false,
    opts = {
        options = {
            transparent = vim.g.transparent_enabled,
        },
    },
    --cond = false,
}

---@type LazySpec
local tokyodark = {
    "tiagovla/tokyodark.nvim",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
    },
    --cond = false,
}

---@type LazySpec
local monokai_pro = {
    "loctvl842/monokai-pro.nvim",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
    },
    --cond = false,
}

---@type LazySpec
local nord = {
    "shaunsingh/nord.nvim",
    --lazy = false,
    config = function()
        vim.g.nord_disable_background = vim.g.transparent_enabled
    end,
    --cond = false,
}

---@type LazySpec
local catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
    },
    priority = 1000,
    --cond = false,
}

---@type LazySpec
local pastelnight = {
    "pauchiner/pastelnight.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
    },
    priority = 1000,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local kurayami = {
    "kevinm6/kurayami.nvim",
    --lazy = false,
    priority = 1000,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local lavi = {
    "b0o/lavi.nvim",
    --lazy = false,
    dependencies = { "rktjmp/lush.nvim" },
    --cond = false,
}

---@type LazySpec
local evergarden = {
    "comfysage/evergarden",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
        contrast_dark = "hard",
        --contrast_dark = "medium",
        --contrast_dark = "soft",
        overrides = {},
    },
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local sunburn = {
    "loganswartz/sunburn.nvim",
    --lazy = false,
    dependencies = { "loganswartz/polychrome.nvim" },
    --cond = false,
}

---@type LazySpec
local eldritch = {
    "eldritch-theme/eldritch.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
    },
    priority = 1000,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local ariake = {
    "jim-at-jibba/ariake.nvim",
    --lazy = false,
    config = true,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local abstract = {
    "Abstract-IDE/Abstract-cs",
    --lazy = false,
    --cond = false,
}

---@type LazySpec
local dark_flat = {
    "sekke276/dark_flat.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        colors = {},
        themes = function()
            return {}
        end,
        italics = true,
    },
    --cond = false,
}

---@type LazySpec
local everblush = {
    "Everblush/nvim",
    name = "everblush",
    --lazy = false,
    opts = {
        override = {},
        transparent_background = vim.g.transparent_enabled,
        nvim_tree = {
            contrast = false,
        },
    },
    --cond = false,
}

---@type LazySpec
local mellow = {
    "mellow-theme/mellow.nvim",
    --lazy = false,
    init = function()
        vim.g.mellow_italic_comments = true
        vim.g.mellow_italic_keywords = false
        vim.g.mellow_italic_booleans = false
        vim.g.mellow_italic_functions = false
        vim.g.mellow_italic_variables = false
        vim.g.mellow_bold_comments = false
        vim.g.mellow_bold_keywords = false
        vim.g.mellow_bold_booleans = false
        vim.g.mellow_bold_functions = false
        vim.g.mellow_bold_variables = false
        vim.g.mellow_transparent = vim.g.transparent_enabled
    end,
    --cond = false,
}

---@type LazySpec
local fluoromachine = {
    "maxmx03/fluoromachine.nvim",
    --lazy = false,
    opts = {
        glow = false,
        brightness = 0.05,
        theme = "fluoromachine",
        --theme = "retrowave",
        --theme = "delta",
        transparent = vim.g.transparent_enabled,
    },
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local srcerite = {
    "m15a/nvim-srcerite",
    --lazy = false,
    dependencies = { "Iron-E/nvim-highlite" },
    init = function()
        vim.g.srcerite_inverse_visual = true
        vim.g.srcerite_inverse_search = false
        vim.g.srcerite_inverse_match_paren = false
    end,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local oldworld = {
    "dgox16/oldworld.nvim",
    --lazy = false,
    opts = {
        -- enable terminal colors
        terminal_colors = true,
        -- You can pass the style using the format: style = true
        styles = {
            -- style for comments
            comments = { italic = true },
            -- style for keywords
            keywords = {},
            -- style for identifiers
            identifiers = {},
            -- style for functions
            functions = { italic = true },
            -- style for variables
            variables = {},
            -- style for booleans
            booleans = {},
        },
        -- You can disable/enable integrations
        integrations = {
            alpha = true,
            cmp = true,
            flash = true,
            gitsigns = true,
            hop = false,
            indent_blankline = true,
            lazy = true,
            lsp = true,
            markdown = true,
            mason = true,
            navic = false,
            neo_tree = false,
            noice = true,
            notify = true,
            rainbow_delimiters = true,
            telescope = true,
            treesitter = true,
        },
    },
    priority = 1000,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local lackluster = {
    "slugbyte/lackluster.nvim",
    --lazy = false,
    priority = 1000,
    --cond = false,
}

-----------------------
-- Vim Script Themes --
-----------------------

---@type LazySpec
local sonokai = {
    "sainnhe/sonokai",
    --lazy = false,
    config = function()
        vim.g.sonokai_style = "default"
        --vim.g.sonokai_style = "atlantis"
        --vim.g.sonokai_style = "andromeda"
        --vim.g.sonokai_style = "shusia"
        --vim.g.sonokai_style = "maia"
        --vim.g.sonokai_style = "espresso"
        vim.g.sonokai_transparent_background = vim.g.transparent_enabled and 1 or 0
        vim.g.sonokai_current_word = vim.g.transparent_enabled and "bold" or "grey background"
        -- if you want more ui components to be transparent
        --vim.g.sonokai_transparent_background = 2
        -- when not in transparent mode,
        --vim.g.sonokai_current_word = "grey background"
        -- when in transparent mode.
        --vim.g.sonokai_current_word = "bold"
        --vim.g.sonokai_current_word = "underline"
        --vim.g.sonokai_current_word = "italic"
        vim.g.sonokai_better_performance = 1
        vim.g.sonokai_disable_italic_comment = 0
        vim.g.sonokai_enable_italic = 0
        vim.g.sonokai_cursor = "auto"
        --vim.g.sonokai_cursor = "red"
        --vim.g.sonokai_cursor = "orange"
        --vim.g.sonokai_cursor = "yellow"
        --vim.g.sonokai_cursor = "green"
        --vim.g.sonokai_cursor = "blue"
        --vim.g.sonokai_cursor = "purple"
        vim.g.sonokai_dim_inactive_windows = 0
        vim.g.sonokai_menu_selection_background = "blue"
        --vim.g.sonokai_menu_selection_background = "green"
        --vim.g.sonokai_menu_selection_background = "red"
        vim.g.sonokai_spell_foreground = "none"
        --vim.g.sonokai_spell_foreground = "colored"
        vim.g.sonokai_show_eob = 1
        vim.g.sonokai_float_style = "bright"
        --vim.g.sonokai_float_style = "dim"
        vim.g.sonokai_diagnostic_text_highlight = 0
        vim.g.sonokai_diagnostic_line_highlight = 0
        vim.g.sonokai_diagnostic_virtual_text = "grey"
        --vim.g.sonokai_diagnostic_virtual_text = "colored"
        --vim.g.sonokai_diagnostic_virtual_text = "highlighted"
        vim.g.sonokai_disable_terminal_colors = 0
        vim.g.sonokai_lightline_disable_bold = 0
        vim.g.sonokai_better_performance = 0
        --vim.g.sonokai_colors_override = {}
    end,
    --cond = false,
}

---@type LazySpec
local edge = {
    "sainnhe/edge",
    --lazy = false,
    config = function()
        vim.g.edge_style = "default"
        --vim.g.edge_style = "aura"
        --vim.g.edge_style = "neon"
        vim.g.edge_transparent_background = vim.g.transparent_enabled and 1 or 0
        vim.g.edge_current_word = vim.g.transparent_enabled and "bold" or "grey background"
        -- if you want more ui components to be transparent
        --vim.g.edge_transparent_background = 2
        vim.g.edge_better_performance = 1
        vim.g.edge_dim_foreground = 0
        vim.g.edge_disable_italic_comment = 0
        vim.g.edge_enable_italic = 0
        vim.g.edge_cursor = "auto"
        --vim.g.edge_cursor = "red"
        --vim.g.edge_cursor = "yellow"
        --vim.g.edge_cursor = "green"
        --vim.g.edge_cursor = "cyan"
        --vim.g.edge_cursor = "blue"
        --vim.g.edge_cursor = "purple"
        vim.g.edge_dim_inactive_windows = 0
        vim.g.edge_menu_selection_background = "blue"
        --vim.g.edge_menu_selection_background = "green"
        --vim.g.edge_menu_selection_background = "purple"
        vim.g.edge_spell_foreground = "none"
        vim.g.edge_spell_foreground = "colored"
        vim.g.edge_show_eob = 1
        vim.g.edge_float_style = "bright"
        --vim.g.edge_float_style = "dim"
        vim.g.edge_diagnostic_text_highlight = 0
        vim.g.edge_diagnostic_line_highlight = 0
        vim.g.edge_diagnostic_virtual_text = "grey"
        --vim.g.edge_diagnostic_virtual_text = "colored"
        --vim.g.edge_diagnostic_virtual_text = "highlighted"
        -- when not in transparent mode
        --vim.g.edge_current_word = "grey background"
        -- when in transparent mode
        --vim.g.edge_current_word = "bold"
        --vim.g.edge_current_word = "underline"
        --vim.g.edge_current_word = "italic"
        vim.g.edge_disable_terminal_colors = 0
        vim.g.edge_lightline_disable_bold = 0
        vim.g.edge_better_performance = 0
        --vim.g.edge_colors_override = {}
    end,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local kyotonight = {
    "shrikecode/kyotonight.vim",
    --lazy = false,
    init = function()
        vim.g.kyotonight_bold = 1
        vim.g.kyotonight_underline = 1
        vim.g.kyotonight_italic = 0
        vim.g.kyotonight_italic_comments = 0
        vim.g.kyotonight_uniform_status_lines = 0
        vim.g.kyotonight_bold_vertical_split_line = 0
        vim.g.kyotonight_cursor_line_number_background = 0
        vim.g.kyotonight_uniform_diff_background = 0
        vim.g.kyotonight_lualine_bold = 1
    end,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local momiji = {
    "kyoh86/momiji",
    --lazy = false,
    --cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local gaming = {
    "high-moctane/gaming.vim",
    --lazy = false,
    init = function()
        -- N ms colors cycle
        vim.g["gaming#period"] = 500
        -- Updating colors every N ms
        vim.g["gaming#update_time"] = 50
    end,
    -- NOTE: noisy
    cond = false,
}

-- NOTE: Not support "transparent = true"
---@type LazySpec
local vim_dogrun = {
    "wadackel/vim-dogrun",
    --lazy = false,
    --cond = false,
}

-------------------------
-- Theme spec template --
-------------------------

---@type LazySpec
local spec_template = {
    "mimikun/spec-template",
    --lazy = false,
    enabled = false,
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --opts = {},
    --config = true,
    cond = false,
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
    eldritch,
    ariake,
    abstract,
    dark_flat,
    everblush,
    mellow,
    fluoromachine,
    srcerite,
    oldworld,
    lackluster,
    -- VimScript themes
    sonokai,
    kyotonight,
    momiji,
    edge,
    gaming,
    vim_dogrun,
    -- theme spec template
    spec_template,
}

return theme_specs
