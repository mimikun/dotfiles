---@type boolean
local use_blink_cmp = require("config.settings").use_blink_cmp

local f = require("plugins.obsidian-nvim.opts.funcs")

-- WORKAROUND: ref: https://github.com/obsidian-nvim/obsidian.nvim/issues/268#issuecomment-3079176695
local old_open = vim.ui.open

vim.ui.open = function(uri, opts)
    opts = opts or { cmd = { "wsl-open" } }
    old_open(uri, opts)
end

---@module 'obsidian'
---@type obsidian.config
local opts = {
    workspaces = require("plugins.obsidian-nvim.opts.workspaces"),

    completion = {
        nvim_cmp = not use_blink_cmp,
        blink = use_blink_cmp,
    },

    disable_frontmatter = true,

    ---@type obsidian.config.OpenOpts
    open = {
        use_advanced_uri = true,
        func = vim.ui.open,
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
