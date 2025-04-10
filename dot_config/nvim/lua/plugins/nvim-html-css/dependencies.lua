---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
}

-- NOTE: When Using `nvim-cmp` ( `use_blink_cmp = false` ), add `cmp-nvim-lsp` to dependencies.
if not require("config.settings").use_blink_cmp then
    table.insert(dependencies, "hrsh7th/nvim-cmp")
-- NOTE: When Using `blink.cmp` ( `use_blink_cmp = true` ), add `blink.cmp` to dependencies.
else
    table.insert(dependencies, "saghen/blink.cmp")
end

return dependencies
