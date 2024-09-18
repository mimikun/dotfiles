---@type table
local opts = {
    keyboard = {
        layout = "qwerty",
        key_labels = {
            ["Up"] = "↑",
            ["Down"] = "↓",
            ["Left"] = "←",
            ["Right"] = "→",
            ["<F1>"] = "F1",
            ["<F2>"] = "F2",
            ["<F3>"] = "F3",
            ["<F4>"] = "F4",
            ["<F5>"] = "F5",
            ["<F6>"] = "F6",
            ["<F7>"] = "F7",
            ["<F8>"] = "F8",
            ["<F9>"] = "F9",
            ["<F10>"] = "F10",
            ["<space>"] = "SPC",
            ["<cr>"] = "ENT",
            ["<tab>"] = "TAB",
        },
    },
}

---@type LazySpec
local spec = {
    "jokajak/keyseer.nvim",
    version = false,
    --lazy = false,
    cmd = "KeySeer",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
