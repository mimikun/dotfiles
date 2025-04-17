---@type LazySpec
local spec = {
    "zenbones-theme/zenbones.nvim",
    --lazy = false,
    dependencies = {
        "rktjmp/lush.nvim",
    },
    init = function()
        vim.g.zenbones = theme_opts
        vim.g.zenwritten = theme_opts
        vim.g.neobones = theme_opts
        vim.g.rosebones = theme_opts
        vim.g.forestbones = theme_opts
        vim.g.tokyobones = theme_opts
        vim.g.seoulbones = theme_opts
        vim.g.kanagawabones = theme_opts
        vim.g.randombones = theme_opts
        -- light only
        vim.g.vimbones = theme_opts
        -- dark only
        vim.g.duckbones = theme_opts
        vim.g.nordbones = theme_opts
        vim.g.zenburned = theme_opts
    end,
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
