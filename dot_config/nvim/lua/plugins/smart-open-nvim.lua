---@type table
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

---@type LazySpec
local spec = {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    --lazy = false,
    dependencies = dependencies,
    --cond = false,
}

return spec
