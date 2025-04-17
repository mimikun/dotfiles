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

if is_human_rights then
    concurrency = is_windows and (vim.uv.available_parallelism() * 2) or nil
else
    concurrency = is_windows and 4 or 6
end

---@type string
local lazy_root = table.concat({ global.data_dir, "lazy" }, path_sep)

---@type string
local lazy_path = table.concat({ lazy_root, "lazy.nvim" }, path_sep)

---@type string
local lazy_state = table.concat({ vim.fn.stdpath("state"), "lazy" }, path_sep)

---@type string
local lazy_repo = "https://github.com/folke/lazy.nvim.git"

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    cmp_sep = iconsets.get("cmp", true),
    misc = iconsets.get("misc"),
}

---@type table
local lazynvim_clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazy_repo,
    lazy_path,
}

if not vim.uv.fs_stat(lazy_path) then
    vim.system(lazynvim_clone_cmd, { text = true }, function(job)
        if job.code == 0 then
            print("Install Lazy.nvim!!!")
        end
    end)
end

vim.opt.rtp:prepend(lazy_path)
require("lazy").setup({
    root = lazy_root,
    defaults = {
        lazy = true,
        cond = true,
    },
    spec = {
        { import = "plugins" },
        { import = "colorschemes" },
    },
    lockfile = table.concat({ vim.fn.stdpath("config"), "lazy-lock.json" }, path_sep),
    concurrency = concurrency,
    git = {
        timeout = 300,
        throttle = {
            enabled = require("config.settings").is_throttling,
        },
        cooldown = 1,
    },
    rocks = {
        enabled = false,
    },
    dev = {
        path = table.concat({ global.home, "ghq", "github.com", "mimikun", "dev-plugins" }, path_sep),
        fallback = true,
    },
    ui = {
        border = "rounded",
        icons = {
            cmd = icons.misc.Code,
            config = icons.ui.Gear,
            -- NOTE: utils/icons.lua has not this icon
            debug = "● ",
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
    diff = {
        cmd = "git",
        --cmd = "diffview.nvim",
    },
    performance = {
        rtp = {
            reset = true,
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
    },
    readme = {
        enabled = true,
        root = table.concat({ lazy_state, "readme" }, path_sep),
        files = {
            "README.md",
            "lua/**/README.md",
        },
    },
    state = table.concat({ lazy_state, "state.json" }, path_sep),
})
