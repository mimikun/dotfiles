local M = {}

---@param cmds table
---@return boolean
M.is_executable = function(cmds)
    local ok, err = pcall(vim.system, cmds)
    if ok then
        return true
    else
        print("Unknown command:" .. table.concat(cmds) .. err)
        return false
    end
end

return M
