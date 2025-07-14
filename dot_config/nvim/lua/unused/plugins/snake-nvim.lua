---@type table
local opts = {
    -- Game speed (ms)
    speed = 240,
    -- Game board dimensions
    map_size = { x = 20, y = 20 },
    -- Maximum number of food items on the board
    max_foods = 1,
    -- Steps between food spawns
    spawn_rate = 5,
}

---@type LazySpec
local spec = {
    "leonardo-luz/snake.nvim",
    --lazy = false,
    cmd = "Snake",
    dependencies = { "leonardo-luz/floatwindow.nvim" },
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
