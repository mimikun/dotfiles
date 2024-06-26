local global = require("core.global")
local iconsets = require("utils.icons")

-- Limit the number of concurrent task depending on human rights or OS
---@type number|function limit the maximum amount of concurrent tasks
local concurrency_limit_check = function()
    local limit
    if global.is_human_rights then
        limit = global.is_windows and (vim.uv.available_parallelism() * 2) or nil
    else
        limit = 6
    end
    return limit
end

---@type number
local concurrency = concurrency_limit_check()

---@type string
local lazy_root = table.concat({ global.data_dir, "lazy" }, global.path_sep)

---@type string
local lazy_path = table.concat({ lazy_root, "lazy.nvim" }, global.path_sep)

---@type table
local icons = {
    kind = iconsets.get("kind"),
    documents = iconsets.get("documents"),
    ui = iconsets.get("ui"),
    ui_sep = iconsets.get("ui", true),
    cmp_sep = iconsets.get("cmp", true),
    misc = iconsets.get("misc"),
}

local Lazy = {}

function Lazy:load_lazy()
    -- Lazy.nvimでのプラグイン管理
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
        },
        rocks = {
            enabled = falase,
        },
        dev = {
            path = table.concat({ global.home, "ghq", "github.com", "mimikun", "dev-plugins" }, global.path_sep),
            fallback = true,
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
                -- NOTE: utils/icons.lua has not this icon
                favorite = " ",
                ft = icons.documents.Files,
                init = icons.misc.ManUp,
                import = icons.documents.Import,
                keys = icons.ui.Keyboard,
                -- NOTE: utils/icons.lua has not this icon
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
