local global = require("core.global")
local iconsets = require("utils.icons")

-- ~/.local/share/nvim
local data_dir = global.data_dir
-- ~/.local/share/nvim/lazy/lazy.nvim
local lazy_path = data_dir .. "lazy/lazy.nvim"

local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    misc = iconsets.get("misc"),
}

local Lazy = {}

function Lazy:load_lazy()
    -- Lazy.nvimでのプラグイン管理
    if not vim.loop.fs_stat(lazy_path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazy_path,
        })
    end

    local lazy_settings = {
        root = data_dir .. "lazy",
        defaults = {
            lazy = true,
            cond = true,
        },
        git = {
            timeout = 300,
        },
        ui = {
            -- a number <1 is a percentage., >1 is a fixed size
            size = { width = 0.88, height = 0.8 },
            -- wrap the lines in the ui
            wrap = true,
            -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
            border = "rounded",
            icons = {
                cmd = icons.misc.Code,
                config = icons.ui.Gear,
                event = icons.kind.Event,
                ft = icons.documents.Files,
                init = icons.misc.ManUp,
                import = icons.documents.Import,
                keys = icons.ui.Keyboard,
                loaded = icons.ui.Check,
                not_loaded = icons.misc.Ghost,
                plugin = icons.ui.Package,
                runtime = icons.misc.Vim,
                source = icons.kind.StaticMethod,
                start = icons.ui.Play,
                list = {
                    icons.ui_sep.BigCircle,
                    icons.ui_sep.BigUnfilledCircle,
                    icons.ui_sep.Square,
                    icons.ui_sep.ChevronRight,
                },
            },
        },
        performance = {
            cache = {
                enabled = true,
                path = vim.fn.stdpath("cache") .. "/lazy/cache",
                -- Once one of the following events triggers, caching will be disabled.
                -- To cache all modules, set this to `{}`, but that is not recommended.
                disable_events = { "UIEnter", "BufReadPre" },
                -- keep unused modules for up to 2 days
                ttl = 3600 * 24 * 2,
            },
            -- reset the package path to improve startup time
            reset_packpath = true,
            rtp = {
                -- reset the runtime path to $VIMRUNTIME and the config directory
                reset = true,
                -- add any custom paths here that you want to include in the rtp
                ---@type string[]
                paths = {},
            },
        },
    }

    vim.opt.rtp:prepend(lazy_path)
    require("lazy").setup("plugins", lazy_settings)
end

Lazy:load_lazy()
