return {
    "narutoxy/silicon.lua",
    --lazy = false,
    --event = "VimEnter",
    --cmd = "",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("silicon").setup({
            theme = "GitHub",
            --font = "monospace",
        })
    end,
    cond = false,
}
