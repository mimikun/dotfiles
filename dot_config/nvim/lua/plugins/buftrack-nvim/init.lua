---@type table
local opts = {
    max_tracked = 8,
}

---@type LazySpec
local spec = {
    "bloznelis/buftrack.nvim",
    --lazy = false,
    cmd = require("plugins.buftrack-nvim.cmds"),
    keys = require("plugins.buftrack-nvim.keys"),
    event = "InsertEnter",
    config = function()
        require("buftrack").setup(opts)

        vim.api.nvim_create_autocmd({ "InsertEnter" }, {
            callback = require("buftrack").track_buffer,
        })
    end,
    cond = false,
    enabled = false,
}

return spec
