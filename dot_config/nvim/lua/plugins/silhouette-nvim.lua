-- Disable if there are no human rights
---@type boolean
local is_human_rights = require("config.global").is_human_rights

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
    cmd = "Silhouette",
    dependencies = dependencies,
    config = function()
        require("denops-lazy").load("silhouette")
        require("silhouette").setup(opts)
    end,
    cond = is_human_rights,
    enabled = is_human_rights,
}

return spec
