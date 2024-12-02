local M = {}

M.update_all = function()
    -- :Lazy sync
    require("lazy").sync()
    -- :TSUpdate
    require("nvim-treesitter.install").commands.TSUpdate.run()
    -- :MasonUpdateAll
    require("masonextracmds.mason").update_all()
end

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
