local global = require("core.global")

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

---@type table
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "skanehira/denops-docker.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = dependencies,
    config = function()
        local denops_lazy = require("denops-lazy")
        denops_lazy.load("denops-docker.vim")
    end,
    -- Disable if there are no human rights
    cond = global.is_human_rights,
}

return spec
