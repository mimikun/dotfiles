---@type table
local built_ins = {
    --"arabic",
    --"armenian",
    --"armenian_lower",
    --"armenian_upper",
    --"greek",
    --"greek_lower",
    --"greek_upper",
    "katakana",
    --"latin",
    --"latin_lower",
    --"latin_upper",
    --"russian",
    --"russian_lower",
    --"russian_upper",
    --"sanskrit",
    --"binary",
    "decimals",
    "symbols",
}

---@type vx.alphabet_props
local alphabet = {
    built_in = built_ins,
    randomize_on_init = true,
    randomize_on_pick = false,
}

return alphabet
