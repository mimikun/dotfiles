-- TODO: config

---@type LazySpec
local spec = {
    "hedyhli/outline.nvim",
    lazy = false,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --init = function()
    --    INIT
    --end,
    --opts = {
    --    OPTS
    --},
    config = function()
        require("outline").setup({})
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    end,
    --cond = false,
    --enabled = false,
}

return spec
