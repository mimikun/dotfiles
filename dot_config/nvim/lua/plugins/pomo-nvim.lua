---@type table
local cmds = {
    "TimerStart",
    "TimerStop",
    "TimerRepeat",
    "TimerRepeat",
    "TimerHide",
    "TimerShow",
    "TimerPause",
    "TimerResume",
}

---@type table
local opts = {
    update_interval = 1000,

    notifiers = {
        {
            name = "Default",
            opts = {
                sticky = true,
                -- TODO: Use utils/icons.lua
                title_icon = "󱎫",
                -- TODO: Use utils/icons.lua
                text_icon = "󰄉",
            },
        },
        { name = "System" },
    },

    timers = {
        Break = {
            { name = "System" },
        },
    },
}

---@type LazySpec
local spec = {
    "epwalsh/pomo.nvim",
    version = "*",
    --lazy = false,
    cmd = cmds,
    dependencies = { "rcarriga/nvim-notify" },
    opts = opts,
    --cond = false,
}

return spec
