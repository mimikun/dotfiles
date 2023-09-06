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
    --cond = false,
}
