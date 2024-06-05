if vim.loader then
    vim.loader.enable()
end

-- NOTE: If this is not present, syntax highlighting for type annotations is disabled.
vim.cmd("filetype plugin indent off")

require("core")

-- NOTE: If this is not present, syntax highlighting for type annotations is disabled.
vim.cmd("filetype plugin indent on")
