---@type boolean
local is_human_rights = require("core.global").is_human_rights
local cond = is_human_rights

---@type LazySpec
local spec = {
    "subnut/nvim-ghost.nvim",
    --lazy = false,
    cmd = "GhostTextStart",
    init = function()
        -- Set port number
        --vim.g.nvim_ghost_server_port = 4001
        -- Start manually
        vim.g.nvim_ghost_autostart = 0
        -- Suppressing all messages
        --vim.g.nvim_ghost_super_quiet = 1
        -- Disable the plugin
        --vim.g.nvim_ghost_disabled = 1
    end,
    cond = cond,
}

return spec
