vim.opt.termguicolors = true

---@type ccc.Options
local opts = {
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
}

require("ccc").setup(opts)
