---@type LazySpec[]
local dependencies = {
    "rafamadriz/friendly-snippets",
}

-- NOTE: When Using `nvim-cmp` ( `use_blink_cmp = false` ), add `cmp_luasnip` to dependencies.
if not require("config.settings").use_blink_cmp then
    table.insert(dependencies, "saadparwaiz1/cmp_luasnip")
end

return dependencies
