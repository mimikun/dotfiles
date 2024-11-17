local global = require("config.global")
local iconsets = require("utils.icons")

---@type string
local path_sep = global.path_sep

---@type boolean
local is_windows = global.is_windows

---@type boolean
local is_human_rights = global.is_human_rights

-- Limit the number of concurrent task depending on human rights or OS
---@type number|nil
local concurrency

-- TODO: choice
if is_human_rights then
    concurrency = is_windows and (vim.uv.available_parallelism() * 2) or nil
else
    concurrency = is_windows and 4 or 6
end

-- TODO: choice
--[[
if is_windows then
    concurrency = is_human_rights and (vim.uv.available_parallelism() * 2) or 4
else
    concurrency = is_human_rights and nil or 6
end
]]

---@type string
local lazy_root = table.concat({ global.data_dir, "lazy" }, path_sep)

---@type string
local lazy_path = table.concat({ lazy_root, "lazy.nvim" }, path_sep)

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    cmp_sep = iconsets.get("cmp", true),
    misc = iconsets.get("misc"),
}

if not vim.uv.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
    })
end

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
        -- rate of network related git operations (clone, fetch, checkout)
        throttle = {
            -- not enabled by default
            enabled = false,
            -- max 2 ops every 5 seconds
            rate = 2,
            -- in ms
            duration = 5 * 1000,
        },
    },
    rocks = {
        enabled = false,
    },
    dev = {
        path = table.concat({ global.home, "ghq", "github.com", "mimikun", "dev-plugins" }, path_sep),
        fallback = true,
    },
    ui = {
        size = { width = 0.88, height = 0.8 },
        wrap = true,
        border = "rounded",
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 60,
        icons = {
            cmd = icons.misc.Code,
            config = icons.ui.Gear,
            event = icons.kind.Event,
            -- NOTE: utils/icons.lua has not this icon
            -- nf-md-star
            favorite = " ",
            ft = icons.documents.Files,
            init = icons.misc.ManUp,
            import = icons.documents.Import,
            keys = icons.ui.Keyboard,
            -- NOTE: utils/icons.lua has not this icon
            -- nf-md-sleep
            lazy = "󰒲 ",
            loaded = icons.ui.Check,
            not_loaded = icons.misc.Ghost,
            plugin = icons.ui.Package,
            runtime = icons.misc.Vim,
            require = icons.cmp_sep.nvim_lua,
            source = icons.kind.StaticMethod,
            start = icons.ui.Play,
            task = icons.ui_sep.Accepted,
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
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            paths = {},
        },
        disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        },
    },
}

vim.opt.rtp:prepend(lazy_path)
require("lazy").setup("plugins", lazy_settings)
