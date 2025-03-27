---@type LazySpec
local spec = {
    "okuuva/auto-save.nvim",
    --lazy = false,
    cmd = "ASToggle",
    keys = require("plugins.auto-save-nvim.keys"),
    event = { "InsertLeave", "TextChanged" },
    config = function()
        require("auto-save").setup(require("plugins.auto-save-nvim.opts"))

        local group = vim.api.nvim_create_augroup("autosave", {})

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveWritePost",
            group = group,
            callback = function(opts)
                if opts.data.saved_buffer ~= nil then
                    local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
                    vim.notify(
                        "AutoSave: saved " .. filename .. " at " .. vim.fn.strftime("%H:%M:%S"),
                        vim.log.levels.INFO
                    )
                end
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveEnable",
            group = group,
            callback = function(opts)
                vim.notify("AutoSave enabled", vim.log.levels.INFO)
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "AutoSaveDisable",
            group = group,
            callback = function(opts)
                vim.notify("AutoSave disabled", vim.log.levels.INFO)
            end,
        })
    end,
    cond = false,
    enabled = false,
}

return spec
