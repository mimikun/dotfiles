local global = require("core.global")
---@type boolean
local is_human_rights = global.is_human_rights
is_human_rights = false

---@type LazySpec
local nvim_ghost = {
    "subnut/nvim-ghost.nvim",
    lazy = false,
    --cmd = "CMDNAME",
    --event = "VeryLazy",
    --opts = {},
    config = function()
        -- TODO:
    end,
    cond = function()
        return not is_human_rights
    end,
}

---@type LazySpec
local dps_ghosttext = {
    "gamoutatsumi/dps-ghosttext.vim",
    lazy = false,
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
