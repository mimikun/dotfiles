return {
    -- TODO: setting
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim", -- optional
        "ibhagwan/fzf-lua", -- optional
    },
    lazy = false,
    --event = "VimEnter",
    --cmd = "",
    config = true,
    cond = false,
}
