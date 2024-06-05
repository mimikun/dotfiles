local global = require("core.global")
---@type boolean
local is_human_rights = global.is_human_rights

---@type table
local dependencies = {
    "vim-denops/denops-shared-server.vim",
    "yuki-yano/denops-lazy.nvim",
}

---@type LazySpec
local spec = {
    "vim-denops/denops.vim",
    --lazy = false,
    --event = "VeryLazy",
    --cmd = "",
    dependencies = dependencies,
    config = function()
        -- Use denops-shared-server if there are no human rights
        vim.g.denops_server_addr = not is_human_rights and "127.0.0.1:32123" or ""

        local denops_lazy = require("denops-lazy")
        denops_lazy.setup({
            wait_load = true,
            wait_server = true,
            wait_server_delay = 10,
            wait_server_retry_limit = 100,
        })
    end,
    -- Disable if there are no human rights
    cond = is_human_rights,
}

return spec
