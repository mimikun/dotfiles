---@type boolean
local is_human_rights = require("config.global").is_human_rights

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
        require("denops-lazy").load("denops-docker.vim")
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

return spec
