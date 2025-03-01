-- TODO: registration of the plugin with telescope.nvim config
--vim.api.nvim_set_keymap('n', '<leader>m', ':Telesscope mru<CR>', { noremap = true, silent = true })

---@type table
local opts = {
    enable_cache = true,
    mru_cache_file = vim.fn.stdpath("data") .. "/nvim-mru.json",
    events = { "BufEnter", "BufWritePost" },
    ignore_path_regexs = { "/.git/" },
}

---@type LazySpec
local spec = {
    "wsdjeg/mru.nvim",
    --lazy = false,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
