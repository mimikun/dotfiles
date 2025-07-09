---@type table
local opts = {
    openTypeDocKeymap = "<C-P>",
    fallback_to_old_on_anything_but_interface_and_type = true,
    fold_lines_after_line = 20,
    keys_that_open_nested_types = { "a", "s", "b", "i", "e", "u", "r", "x" },
    types_to_not_expand = { "string", "number", "boolean", "Date" },
}

---@type LazySpec
local spec = {
    "Sebastian-Nielsen/better-type-hover",
    --lazy = false,
    event = "LspAttach",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
