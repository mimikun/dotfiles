local M = {}

---@return string
M.improved_encoding = function()
    local encoding = vim.opt.fileencoding:get()
    if encoding == "utf-8" then
        encoding = "UTF-8"
    elseif encoding == "cp932" then
        encoding = "SHIFT-JIS"
    elseif encoding == "euc-jp" then
        encoding = "EUC-JP"
    else
        encoding = encoding
    end
    return encoding
end

---@return table|nil
M.diff_source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

---@return string|nil
M.eskk_mode = function()
    if vim.fn["eskk#is_enabled"]() then
        ---@type string
        local get_mode = vim.fn["eskk#get_mode"]()
        return get_mode
    end
end

---@return string
M.special_notice = function()
    local special_msg = "コロナを忘れるな！"
    return special_msg
end

return M
