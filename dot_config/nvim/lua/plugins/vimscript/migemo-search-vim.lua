-- Enable if there are no human rights and if executable cmigemo command
---@type boolean
local is_not_human_rights = not require("core.global").is_human_rights
---@type boolean
local has_cmigemo = (1 == vim.fn.executable("cmigemo")) and true or false
---@type boolean
local cond = is_not_human_rights and has_cmigemo

---@type LazySpec
local spec = {
    "rhysd/migemo-search.vim",
    lazy = false,
    config = function()
        -- TODO: config use lua
        vim.cmd([[cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"]])
    end,
    cond = cond,
}

return spec
