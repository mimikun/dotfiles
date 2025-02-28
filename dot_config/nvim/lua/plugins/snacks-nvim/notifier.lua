---@class snacks.notifier.Config
---@field enabled? boolean
---@field keep? fun(notif: snacks.notifier.Notif): boolean # global keep function
---@field filter? fun(notif: snacks.notifier.Notif): boolean # filter our unwanted notifications (return false to hide)
local Config = {
    enabled = true,
    -- default timeout in ms
    timeout = 3000,
    width = { min = 40, max = 0.4 },
    height = { min = 1, max = 0.6 },
    -- editor margin to keep free. tabline and statusline are taken into account automatically
    margin = { top = 0, right = 1, bottom = 0 },
    -- add 1 cell of left/right padding to the notification window
    padding = true,
    -- sort by level and time
    sort = { "level", "added" },
    -- minimum log level to display. TRACE is the lowest
    -- all notifications are stored in history
    level = vim.log.levels.TRACE,
    icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
    },
    keep = function(notif)
        return vim.fn.getcmdpos() > 0
    end,
    ---@type snacks.notifier.style
    style = "compact",
    -- place notifications from top to bottom
    top_down = true,
    -- time format for notifications
    date_format = "%R",
    -- format for footer when more lines are available
    -- `%d` is replaced with the number of lines.
    -- only works for styles with a border
    ---@type string|boolean
    more_format = " ↓ %d lines ",
    -- refresh at most every 50ms
    refresh = 50,
}

return Config
