---@type table
local opts = {
    wait_load = true,
    wait_server = true,
    wait_server_delay = 10,
    wait_server_retry_limit = 100,
}

---@type LazySpec
local spec = {
    "yuki-yano/denops-lazy.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = { "vim-denops/denops.vim" },
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
