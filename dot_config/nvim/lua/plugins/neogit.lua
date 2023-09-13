return {
    -- TODO: setting
    -- https://github.com/NeogitOrg/neogit/blob/master/README.md
    "NeogitOrg/neogit",
    lazy = false,
    --event = "VimEnter",
    --cmd = "",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim", -- optional
        "ibhagwan/fzf-lua", -- optional
    },
    config = true,
    cond = false,
}
