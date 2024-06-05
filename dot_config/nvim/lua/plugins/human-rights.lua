---@type table
local cmds = {
    "ShowCpu",
    "ShowMemory",
    "ShowParallelism",
    "ShowDisk",
}

---@type LazySpec
local spec = {
    "mimikun/human-rights.nvim",
    dev = true,
    --lazy = false,
    cmd = cmds,
    opts = {
        cpu = {
            "Ryzen 9 3900X",
            "i5-13500H",
        },
        memory = {
            -- 4GB
            linux = 4294967296,
            -- 9GB
            windows = 9663676416,
        },
        available_parallelism = 14,
        media_type = "SSD",
    },
    --cond = false,
}

return spec
