-- Enable if there are no human rights and if executable cmigemo command
local is_not_human_rights = not require("core.global").is_human_rights
local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
local cond = is_not_human_rights and has_cmigemo

return {
    "rhysd/migemo-search.vim",
    lazy = false,
    --event = "VeryLazy",
    --keys = keymaps,
    config = function()
        -- TODO: config use lua
        -- sample:
        -- vim.g["fern#default_hidden"] = 1
    end,
    cond = cond,
}
