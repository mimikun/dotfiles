return {
    "saecki/crates.nvim",
    --lazy = false,
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("crates").setup()
    end,
    --cond = false,
}
