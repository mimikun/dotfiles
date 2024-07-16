---@type table
local cmds = {
    "RemindMeEvery",
    "RemindMeAt",
    "RemindMeIn",
    "RemindMeDailyAt",
    "ReminderClose",
    "ReminderRemoveAt",
    "ReminderRemoveAll",
    "ReminderFocusModeOff",
    "ReminderFocusModeOn",
}

---@type table
local opts = {
    -- TODO: fix file saving path
    directory_path = "/tmp/",
}

---@type LazySpec
local spec = {
    "rodolfojsv/reminders.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "rcarriga/nvim-notify" },
    config = function()
        require("reminders").setup(opts)
    end,
    --cond = false,
}

return spec
