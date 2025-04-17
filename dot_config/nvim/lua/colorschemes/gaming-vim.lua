---@type LazySpec
local spec = {
    "high-moctane/gaming.vim",
    --lazy = false,
    init = function()
        -- N ms colors cycle
        vim.g["gaming#period"] = 500
        -- Updating colors every N ms
        vim.g["gaming#update_time"] = 50
    end,
    cond = false,
    enabled = false,
    optional = true,
}

return spec
