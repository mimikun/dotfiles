local global = require("core.global")
local iconsets = require("utils.icons")

local uv = vim.uv and vim.uv or vim.loop

local home = global.home
local data_dir = global.data_dir
local path_sep = global.path_sep

---@type boolean
local is_windows = global.is_windows
---@type boolean
local is_human_rights = global.is_human_rights

-- Limit the number of concurrent task depending on human rights or OS
---@type number|function limit the maximum amount of concurrent tasks
local concurrency_limit_check = function()
    local limit
    if is_human_rights then
        limit = is_windows and (uv.available_parallelism() * 2) or nil
    else
        limit = 1
    end
    return limit
end

---@type number
local concurrency = concurrency_limit_check()

---@type string
local lazy_root = table.concat({ data_dir, "lazy" }, path_sep)
---@type string
local lazy_path = table.concat({ lazy_root, "lazy.nvim" }, path_sep)
---@type string
local dev_path = table.concat({ home, "ghq", "github.com", "mimikun", "dev-plugins" }, path_sep)

---@type table
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
    if not uv.fs_stat(lazy_path) then
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
        dev = {
            path = dev_path,
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
