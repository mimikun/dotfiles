---@type table
local opts = {
    lsp = {
        diagnostic_update_events = { "BufWritePost" },
        root_dir = function(_, bufnr)
            return vim.fs.root(bufnr or 0, {
                ".git",
                "_quarto.yml",
                "package.json",
            }) or vim.fn.getcwd(0)
        end,
    },
    buffers = {
        set_filetype = false,
        write_to_disk = false,
    },
    strip_wrapping_quote_characters = { "'", '"', "`" },
    handle_leading_whitespace = true,
    extensions = {},
    debug = false,
    verbose = {
        no_code_found = false,
    },
}

return opts
