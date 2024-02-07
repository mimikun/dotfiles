local global = require("core.global")
local is_human_rights = global.is_human_rights

return {
    "skanehira/denops-translate.vim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Translate",
    dependencies = {
        "vim-denops/denops.vim",
    },
    config = function()
        -- If `vim.opt.ambiwidth = "double"` is set, `vim.g.translate_border_chars` must be set.
        -- ref: https://github.com/skanehira/denops-translate.vim/issues/66
        vim.g.translate_border_chars = { "+", "-", "+", "|", "+", "-", "+", "|" }
    end,
    -- Disable if there are no human rights
    --cond = is_human_rights,
    cond = false,
}
