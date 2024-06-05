local M = {}

-- Git管理下かどうか判定
---@return boolean
M.is_git = function()
    vim.fn.system("git status")
    if 0 == vim.v.shell_error then
        return true
    else
        return false
    end
end

return M
