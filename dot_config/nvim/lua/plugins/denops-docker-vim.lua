local global = require("core.global")
local is_human_rights = global.is_human_rights

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
    -- Disable if there are no human rights
    cond = is_human_rights,
}
