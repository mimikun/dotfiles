-- Disable if there are no human rights
---@type boolean
local is_human_rights = require("config.global").is_human_rights

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
}

---@type table
local opts = {
    task = {
        repetition_tasks_path = "./repetition-tasks.md",
        holidays_path = "./holidays.md",
    },
}

---@type table
local cmds = {
    "SilhouetteInsertTasks",
    "SilhouetteMoveToProgress",
    "SilhouetteShowTaskDates",
}

---@type LazySpec
local spec = {
    "tadashi-aikawa/silhouette.nvim",
    -- NOTE: denops NOT support lazy loading (maybe)
    lazy = false,
    ft = "markdown",
    cmd = cmds,
    dependencies = dependencies,
    config = function()
        vim.defer_fn(function()
            require("silhouette").setup(opts)
        end, 1000)
    end,
    cond = is_human_rights,
    enabled = is_human_rights,
}

return spec
