---@type boolean
local cond = require("config.global").is_home

---@type table
local cmds = {
    "SilhouetteInsertTasks",
    "SilhouetteMoveToProgress",
    "SilhouetteShowTaskDates",
    "SilhouettePushTimer",
    "SilhouetteForceStopRecording",
}

---@type table
local opts = {
    task = {
        repetition_tasks_path = "./repetition-tasks.md",
        holidays_path = "./holidays.md",
    },
    timer = {
        time_storage_path = "./time-storage.json",
        check_box_mark = {
            recording = "~",
            stop = " ",
        },
    },
}

---@type LazySpec
local spec = {
    "tadashi-aikawa/silhouette.nvim",
    lazy = false,
    ft = "markdown",
    cmd = cmds,
    --event = "User DenopsReady",
    dependencies = { "vim-denops/denops.vim" },
    config = function()
        vim.defer_fn(function()
            require("silhouette").setup(opts)
        end, 10000)
    end,
    cond = cond,
    enabled = cond,
}

return spec
