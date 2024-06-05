require("core.plugin").init()

local global = require("config.global")
local iconsets = require("utils.icons")
local lazy = require("lazy")

---@type string
local path_sep = global.path_sep
---@type string
local data_dir = global.data_dir

---@type string
local lazy_root = table.concat({ data_dir, "lazy" }, path_sep)
---@type string
local dev_path = table.concat({ global.home, "ghq", "github.com", "mimikun", "dev-plugins" }, path_sep)

-- TODO: fix type, and use human-rights.nvim
---@type any
local concurrency
if global.is_human_rights then
    concurrency = global.is_windows and (vim.uv.available_parallelism() * 2) or nil
else
    concurrency = 1
end

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    misc = iconsets.get("misc"),
}

---@type table
local lazy_settings = {
    root = lazy_root,
    defaults = {
        lazy = true,
        cond = true,
    },
    concurrency = concurrency,
    git = {
        timeout = 300,
    },
    dev = {
        path = dev_path,
        fallback = true,
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "github_dark" },
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
    checker = {
        enabled = false,
        concurrency = concurrency,
        -- get a notification when new updates are found
        notify = true,
        -- check for updates every hour
        frequency = 3600,
        -- check for pinned packages that can't be updated
        check_pinned = false,
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        -- get a notification when changes are found
        notify = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
        -- reset the package path to improve startup time
        reset_packpath = true,
        rtp = {
            -- reset the runtime path to $VIMRUNTIME and the config directory
            reset = true,
            -- add any custom paths here that you want to include in the rtp
            ---@type string[]
            paths = {},
            ---@type string[]
            disabled_plugins = {},
        },
    },
}

lazy.setup("plugins", lazy_settings)
