local global = require("config.global")
local events = require("plugins.fastspell-nvim.events")

local base_path =
    table.concat({ global.data_dir, "lazy", "fastspell.nvim", "lua", "scripts", "install" }, global.path_sep)

---@type LazySpec
local spec = {
    "lucaSartore/fastspell.nvim",
    build = function()
        local cmd = base_path .. (global.is_windows and "cmd" or "sh")
        vim.system({ cmd })
    end,
    --lazy = false,
    event = events,
    config = function()
        local fastspell = require("fastspell")

        fastspell.setup(require("plugins.fastspell-nvim.opts"))

        vim.api.nvim_create_autocmd(events, {
            callback = function(_)
                local first_line = vim.fn.line("w0") - 1
                local last_line = vim.fn.line("w$")
                fastspell.sendSpellCheckRequest(first_line, last_line)
            end,
        })
    end,
    cond = false,
    enabled = false,
}

return spec
