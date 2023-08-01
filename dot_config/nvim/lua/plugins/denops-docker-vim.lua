return {
    "skanehira/denops-docker.vim",
    dependencies = {
        "vim-denops/denops.vim",
    },
    cmd = {
        "Docker",
        "DockerImages",
        "DockerContainers",
        "DockerSearchImage",
        "DockerAttachContainer",
        "DockerExecContainer",
        "DockerShowContainerLog",
        "DockerEditFile",
    },
    --cond = false,
}
