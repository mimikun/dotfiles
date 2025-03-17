---@type string
local storage_dir = table.concat({ vim.fn.stdpath("data"), "persist-quickfix" }, require("config.global").path_sep)

--- @type PersistQuickfix.Config
local opts = {
    storage_dir = storage_dir,
    selector = function(items, callback)
        vim.ui.select(items, {}, function(item)
            callback(item)
        end)
    end,
}

return opts
