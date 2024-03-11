local global = require("core.global")
---@type boolean
local is_human_rights = global.is_human_rights

---@type table
local cmds = {
    "Docker",
    "DockerImages",
    "DockerContainers",
    "DockerSearchImage",
    "DockerAttachContainer",
    "DockerExecContainer",
    "DockerShowContainerLog",
    "DockerEditFile",
}

---@type LazySpec
local spec = {
    "skanehira/denops-docker.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = {
        "vim-denops/denops.vim",
        "yuki-yano/denops-lazy.nvim",
    },
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("denops-docker.vim")
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

return spec
