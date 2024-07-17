local opts = {
    colors = {
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#9745be",
    },
    line_opacity = 0.15,
    set_cursor = true,
    set_cursorline = true,
    set_number = true,
    ignore_filetypes = { "NvimTree", "TelescopePrompt" },
}

---@type LazySpec
local spec = {
    "mvllow/modes.nvim",
    tag = "v0.2.0",
    --lazy = false,
    event = "BufRead",
    config = function()
        require("modes").setup(opts)
        -- NOTE: WORKAROUND bug
        -- https://github.com/mvllow/modes.nvim/issues/50#issuecomment-2105522342
        vim.opt.guicursor:append("n-c:block-Cursor")
    end,
    cond = false,
}

return spec
