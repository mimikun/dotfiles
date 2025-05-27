local g = require("config.global")

local is_human_rights = g.is_human_rights
local is_windows = g.is_windows

local M = {}

---@return number
M.check_lazy = function()
    ---@type number
    local concurrency_value

    ---@type number
    local available_parallelism = vim.uv.available_parallelism() or 1

    if is_human_rights then
        concurrency_value = is_windows and (available_parallelism * 2) or available_parallelism
    else
        concurrency_value = is_windows and 4 or 6
    end

    -- NOTE: When you first set it up, you need to do it slowly or you will get an error.
    if vim.env.SETUP_NVIM_FIRST_TIME then
        concurrency_value = 1
    end

    return concurrency_value
end

---@return number
M.check_mason = function()
    ---@type number
    local concurrency_value

    concurrency_value = is_human_rights and 4 or 1

    return concurrency_value
end

return M
