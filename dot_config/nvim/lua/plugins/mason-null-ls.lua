return {
    "jay-babu/mason-null-ls.nvim",
    --lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    opts = {
        handlers = {},
    },
    -- TODO: settings
    --cond = false,
}
