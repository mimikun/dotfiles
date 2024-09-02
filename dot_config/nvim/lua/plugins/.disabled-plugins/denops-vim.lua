--- Disable if there are no human rights
---@type boolean
local is_human_rights = require("config.global").is_human_rights

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops-shared-server.vim",
}

---@type LazySpec
local spec = {
    "vim-denops/denops.vim",
    -- NOTE: denops NOT support lazy loading (maybe)
    lazy = false,
    dependencies = dependencies,
    config = function()
        -- Install denops-shared-server and set address
        if not is_human_rights then
            vim.fn["denops_shared_server#install"]()
            vim.g.denops_server_addr = "127.0.0.1:32123"
        end
    end,
    cond = is_human_rights,
    enabled = is_human_rights,
}

return spec
