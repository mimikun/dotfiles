---@type table
local opts = {
    buffer = {
        result_prefix = "=> ",
        save_path = table.concat({
            vim.fn.stdpath("state"),
            "lua-console.lua",
        }, require("config.global").path_sep),
    },
    window = {
        border = "rounded",
    },
}

return opts
