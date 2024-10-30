---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>e",
        mode = { "n" },
        function()
            require("trek").open(vim.api.nvim_buf_get_name(0))
        end,
        desc = "File Explorer",
    },
}

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    lsp = {
        timeout_ms = 500,
        autosave_changes = true,
    },
    keymaps = {
        close = "q",
        go_in = "<Right>",
        go_out = "<Left>",
        synchronize = "=",
    },
}

---@type LazySpec
local spec = {
    "stefanwatt/trek.nvim",
    lazy = false,
    keys = keys,
    dependencies = dependencies,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
