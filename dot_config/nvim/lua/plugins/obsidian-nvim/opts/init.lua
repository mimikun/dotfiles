---@type boolean
local use_blink_cmp = require("config.settings").use_blink_cmp

local f = require("plugins.obsidian-nvim.opts.funcs")

---@module 'obsidian'
---@type obsidian.config
local opts = {
    workspaces = require("plugins.obsidian-nvim.opts.workspaces"),

    completion = {
        nvim_cmp = not use_blink_cmp,
        blink = use_blink_cmp,
    },

    disable_frontmatter = true,

    open = {
        use_advanced_uri = true,
    },

    ui = {
        enable = false,
        ignore_conceal_warn = false,
    },

    note_id_func = f.note_id_func,
    note_path_func = f.note_path_func,
    note_frontmatter_func = f.note_frontmatter_func,
    follow_url_func = f.follow_url_func,
    follow_img_func = f.follow_img_func,
    wiki_link_func = f.wiki_link_func,
    markdown_link_func = f.markdown_link_func,

    legacy_commands = false,

    -- WORKAROUND: https://github.com/obsidian-nvim/obsidian.nvim/issues/289
    statusline = {
        enabled = false,
    },
}

return opts
