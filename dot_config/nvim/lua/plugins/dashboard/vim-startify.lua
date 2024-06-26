local iconsets = require("utils.icons")
local bannars = require("utils.bannars")
local icons = {
    ui = iconsets.get("ui", true),
    misc = iconsets.get("misc", true),
    kind = iconsets.get("kind", true),
}

---@type string
local quick_links = icons.ui.List .. "Quick links"
---@type string
local new_file = icons.ui.NewFile .. "New file"
---@type string
local update_plugins = icons.misc.Update .. "Update plugins"
---@type string
local open_mason_window = icons.ui.Gear .. "Open Mason Window"
---@type string
local run_checkhealth = icons.ui.Accepted .. "Run checkhealth"
---@type string
local quit_nvim = icons.ui.Close_alt .. "Quit NVIM"
---@type string
local search_files = icons.ui.Search .. "Search Files"
---@type string
local run_oil = icons.kind.File .. "Open Oil"
---@type string
local show_mru = icons.ui.Package .. "MRU"
---@type string
local dotfyle_generate = icons.ui.Gear .. "Generate Dotfyle"
---@type string
local ts_update = icons.ui.Gear .. "Update TreeSitter parsers"

local bannar = bannars.get("covid_19").Japan

---@type table
local cmds = {
    "Startify",
    "SLoad",
    "SSave",
    "SDelete",
    "SClose",
}

---@type LazySpec
local spec = {
    "mhinz/vim-startify",
    --lazy = false,
    cmd = cmds,
    event = "VimEnter",
    config = function()
        vim.g.startify_bookmarks = {}
        vim.g.startify_change_to_dir = 1
        vim.g.startify_change_to_vcs_root = 0
        vim.g.startify_change_cmd = "lcd"
        vim.g.startify_custom_header = bannar
        vim.g.startify_enable_special = 0
        vim.g.startify_lists = {
            --{ type = "files", header = { "   MRU" } },
            --{ type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
            --{ type = "sessions", header = { "   Sessions" } },
            --{ type = "bookmarks", header = { "   Bookmarks" } },
            { type = "commands", header = { "   Commands" } },
        }
        vim.g.startify_skiplist = {
            "/.git/",
            "^/tmp",
        }
        vim.g.startify_update_oldfiles = 0
        vim.g.startify_commands = {
            { f = { search_files, "Telescope smart_open" } },
            { r = { show_mru, "Telescope oldfiles" } },
            -- TODO: Use `.`
            { o = { run_oil, "Oil" } },
            { u = { update_plugins, "Lazy sync" } },
            { m = { open_mason_window, "Mason" } },
            { t = { ts_update, "TSUpdate" } },
            { c = { run_checkhealth, "checkhealth" } },
            { d = { dotfyle_generate, "DotfyleGenerate --keymaps" } },
        }
        vim.g.startify_custom_footer = ""
        --vim.g.startify_custom_header_quotes = nil
        -- TODO: Use Lua function
        vim.g.startify_custom_indices = vim.cmd([[map(range(1,100), 'string(v:val)')]])
        vim.g.startify_disable_at_vimenter = 0
        vim.g.startify_enable_unsafe = 0
        vim.g.startify_files_number = 5
        vim.g.startify_fortune_use_unicode = 0
        vim.g.startify_padding_left = 3
        vim.g.startify_relative_path = 0
        vim.g.startify_skiplist_server = {}
        vim.g.startify_use_env = 0
        vim.g.startify_session_autoload = 0
        vim.g.startify_session_before_save = {}
        vim.g.startify_session_delete_buffers = 1
        vim.g.startify_session_dir =
            table.concat({ vim.fn.stdpath("data"), "session" }, require("core.global").path_sep)
        vim.g.startify_session_number = 999
        vim.g.startify_session_persistence = 0
        vim.g.startify_session_remove_lines = {}
        vim.g.startify_session_savecmds = {}
        vim.g.startify_session_savevars = {}
        vim.g.startify_session_sort = 0
    end,
    cond = false,
}

return spec
