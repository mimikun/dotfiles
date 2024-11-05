---@type number
local DELAY_SEC = 5000

---@type table
local opts = {
    task = {
        repetition_tasks_path = "./repetition-tasks.md",
        holidays_path = "./holidays.md",
    },
}

vim.defer_fn(function()
    require("silhouette").setup(opts)
end, DELAY_SEC)

vim.keymap.set("n", "<Space>sp", ":SilhouetteMoveToProgress<CR>", { silent = true })
