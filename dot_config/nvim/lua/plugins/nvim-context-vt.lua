---@type table
local opts = {
    prefix = "",
    disable_ft = { "markdown" },
    disable_virtual_lines_ft = {},
}

---@type LazySpec
local spec = {
    "andersevenrud/nvim_context_vt",
    --lazy = false,
    cmd = "NvimContextVtToggle",
    event = "BufEnter",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
