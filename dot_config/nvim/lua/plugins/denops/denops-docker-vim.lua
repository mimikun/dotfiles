--- Disable if there are no human rights
---@type boolean
local cond = require("core.global").is_human_rights

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
    cmd = cmds,
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("denops-docker.vim")
    end,
    cond = cond,
}

return spec
