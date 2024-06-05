---@type LazySpec
local puzzle_15 = {
    "NStefan002/15puzzle.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Play15puzzle",
    config = true,
    --cond = false,
}

---@type LazySpec
local game_2048 = {
    "NStefan002/2048.nvim",
    --lazy = false,
    cmd = "Play2048",
    config = true,
    --cond = false,
}

---@type LazySpec
local strat_hero = {
    "willothy/strat-hero.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "StratHero",
    config = true,
    --cond = false,
}

---@type LazySpec[]
local specs = {
    puzzle_15,
    game_2048,
    strat_hero,
}

return specs
