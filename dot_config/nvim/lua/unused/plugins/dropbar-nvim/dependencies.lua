---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not require("config.global").is_windows then
    table.insert(dependencies, { "nvim-telescope/telescope-fzf-native.nvim", build = "make" })
end

return dependencies
