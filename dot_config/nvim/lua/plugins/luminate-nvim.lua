---@type table
local opts = {
    yank = {
        enabled = false,
    },
    paste = {
        enabled = true,
    },
    undo = {
        enabled = true,
    },
    redo = {
        enabled = true,
    },
}

---@type LazySpec
local spec = {
    "mei28/luminate.nvim",
    --lazy = false,
    event = "VeryLazy",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
