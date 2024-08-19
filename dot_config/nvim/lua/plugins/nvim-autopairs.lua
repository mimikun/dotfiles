---@type table
local opts = {
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
}

---@type LazySpec
local spec = {
    "windwp/nvim-autopairs",
    --lazy = false,
    event = "InsertEnter",
    opts = opts,
    --cond = false,
    -- NOTE: autopair plugin
    --enabled = false,
}

return spec
