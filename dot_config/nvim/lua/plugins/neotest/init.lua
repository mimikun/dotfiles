---@type LazySpec
local spec = {
    "nvim-neotest/neotest",
    --lazy = false,
    cmd = "Neotest",
    --keys = "",
    dependencies = require("plugins.neotest.dependencies"),
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
