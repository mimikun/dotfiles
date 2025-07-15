---@type table
local opts = {
    minutes = { 25, 5 },
    on_finish = function()
        vim.notify("Timerly: time's up!")
    end,
    -- top-left, top-right, bottom-left, bottom-right
    position = "center",
}

---@type LazySpec
local spec = {
    "nvzone/timerly",
    --lazy = false,
    cmd = "TimerlyToggle",
    dependencies = { "nvzone/volt" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
