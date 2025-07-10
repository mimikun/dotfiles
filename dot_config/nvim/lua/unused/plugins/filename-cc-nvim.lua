---@type table
local opts = {
    enabled = true,
    skip_filetypes = {
        "json",
        "markdown",
    },
    comment_formats = {
        lua = "-- %s",
        python = "# %s",
    },
    format = "filename: {filepath}",
    position = 1,
}

---@type LazySpec
local spec = {
    "ekhar/filename_cc.nvim",
    --lazy = false,
    event = "BufWritePre",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
