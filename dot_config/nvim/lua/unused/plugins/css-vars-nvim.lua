---@type table
local opts = {
    cmp_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    -- WARNING: The search is not optimized to look for variables in JS files.
    -- If you change the search_extensions you might get false positives and weird completion results.
    search_extensions = {
        ".js",
        ".ts",
        ".jsx",
        ".tsx",
    },
}

---@type LazySpec
local spec = {
    "jdrupal-dev/css-vars.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
