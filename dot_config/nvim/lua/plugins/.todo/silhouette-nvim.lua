---@type table
local cmds = {
    "SilhouetteInsertTasks",
    "SilhouetteMoveToProgress",
    "SilhouetteShowTaskDates",
}

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type table
local opts = {
    task = {
        repetition_tasks_path = "./repetition-tasks.md",
        holidays_path = "./holidays.md",
    },
}

---@type LazySpec
local spec = {
    "tadashi-aikawa/silhouette.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = cmds,
    event = "User DenopsReady",
    dependencies = dependencies,
    config = function(spec)
        vim.defer_fn(function()
            require("silhouette").setup(opts)
        end, 10000)
        require("denops-lazy").load(spec.name)
    end,
    --cond = false,
    --enabled = false,
}

return spec
