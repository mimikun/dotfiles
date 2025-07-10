---@type table
local opts = {
    new_tab_explorer = false, -- Set to true to use `:Exp` on new tabs
    -- prompt_title = "Prompt inside Telescope" -- Optional
    -- prompt_icon = "> " -- Optional: good if you don't have a NerdFont
    drop_locations = {
        { name = "Projects", dir = "~/Workspace" },
        { name = "Neovim Config", dir = "~/.config/nvim" },
        { name = "University", dir = "~/Documents/school/university" },
        --drop_locations = "~/.cache/droplist.lua"
    },
}

return opts
