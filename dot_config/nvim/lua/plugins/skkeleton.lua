local keymaps = {
    { "<C-j>", desc = "Toggle Kana-mode skkeleton" },
}

return {
    "vim-skk/skkeleton",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        -- TODO: setting
        -- https://github.com/vim-skk/skkeleton/blob/main/doc/skkeleton.jax
        vim.keymap.set("i", "<C-j>", [[<Plug>(skkeleton-toggle)]])
        vim.keymap.set("c", "<C-j>", [[<Plug>(skkeleton-toggle)]])
    end,
    --cond = false,
}
