---@type table
local opts = {
    -- or line number thousands separator string ("." / ",")
    thousands = false,
    -- whether to right-align the cursor line number with 'relativenumber' set
    relculright = false,
}

---@type LazySpec
local spec = {
    "luukvbaal/statuscol.nvim",
    --lazy = false,
    event = "BufEnter",
    opts = opts,
    --cond = false,
    -- NOTE: statuscolumn plugin
    enabled = false,
}

return spec
