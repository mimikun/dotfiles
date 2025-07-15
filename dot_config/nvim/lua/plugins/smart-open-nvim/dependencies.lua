---@type LazySpec[]
local dependencies = {
    "kkharji/sqlite.lua",
}

-- NOTE: Add fzf_sorter if not a Windows
-- NOTE: Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(dependencies, {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    })
end

return dependencies
