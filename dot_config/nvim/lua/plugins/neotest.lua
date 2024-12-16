---@type LazySpec[]
local dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- adapters
    "nvim-neotest/neotest-plenary",
    "marilari88/neotest-vitest",
    "mrcjkb/rustaceanvim",
    "markemmons/neotest-deno",
    "rcasia/neotest-bash",
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    "MisanthropicBit/neotest-busted",
}

---@type LazySpec
local spec = {
    "nvim-neotest/neotest",
    --lazy = false,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-plenary"),
                require("neotest-vitest"),
                require("rustaceanvim.neotest"),
                require("neotest-deno"),
                require("neotest-bash"),
                require("neotest-vim-test")({ ignore_filetypes = { "lua" } }),
                require("neotest-busted")({
                    local_luarocks_only = true,
                    parametric_test_discovery = false,
                }),
            },
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
