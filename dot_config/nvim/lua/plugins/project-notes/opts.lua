---@type table
local opts = {
    notes_path = ".notes",
    autosave = true,
    extension = ".md",
    sign = "󱞁", --   󰎞
    keymaps = {
        main = "<leader>nm",
        toggle = "<leader>nt",
        list = "<leader>nl",
    },
}

return opts
