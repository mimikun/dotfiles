-- Disable if there are no human rights
local cond = require("core.global").is_human_rights

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

return {
    "skanehira/denops-docker.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = {
        "vim-denops/denops.vim",
    },
    cond = cond,
}
