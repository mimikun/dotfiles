---@type table
local opts = {
    -- where is freeze installed
    freeze_path = vim.fn.exepath("freeze"),
    -- the default copy commands `gclip` or native to your OS (see below)
    copy_cmd = "gclip",
    -- copy after screenshot option
    copy = false,
    -- open after screenshot option
    open = false,
    -- where is the image going to be saved "." as default
    dir = vim.env.PWD,
    -- configuration options for `freeze` command
    freeze_config = {
        output = "freeze.png",
        config = "base",
        theme = "default",
    },
}

---@type LazySpec
local spec = {
    "AlejandroSuero/freeze-code.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
