local global = require("core.global")
---@type boolean
local is_human_rights = global.is_human_rights

---@type LazySpec
local nvim_ghost = {
    "subnut/nvim-ghost.nvim",
    --lazy = false,
    cmd = "GhostTextStart",
    --event = "VeryLazy",
    config = function()
        vim.g.nvim_ghost_server_port = 4001
        -- Start manually
        vim.g.nvim_ghost_autostart = 0
        -- Suppressing all messages
        --vim.g.nvim_ghost_super_quiet = 1
        -- Disable the plugin
        --vim.g.nvim_ghost_disabled = 1
    end,
    --cond = false,
}

---@type LazySpec
local dps_ghosttext = {
    "gamoutatsumi/dps-ghosttext.vim",
    --lazy = false,
    cmd = "GhostStart",
    --event = "VeryLazy",
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
    },
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("dps-ghosttext.vim")

        --[[
        g:dps_ghosttext#ftmap
            Dictionary of filetype mappings.
            Normally, key is domain name.
            (e.g. If in "www.github.com" so "github.com") Value is generally vim filetypes.
            (e.g. "markdown")
            Default: {"github.com": "markdown"}
        ]]
        vim.g["dps_ghosttext#disable_defaultmap"] = 0
        vim.g["dps_ghosttext#enable_autostart"] = 0
    end,
    cond = is_human_rights,
}

---@type LazySpec[]
local specs = {
    nvim_ghost,
    dps_ghosttext,
}

return specs
