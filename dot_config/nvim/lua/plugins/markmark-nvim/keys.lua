---@type LazyKeysSpec[]
local keys = {
    { "]#", vim.cmd(":MarkMarkNextHeader<CR>"), desc = "Next Header" },
    { "[#", vim.cmd(":MarkMarkPrevHeader<CR>"), desc = "Previous Header" },
    { "]`", vim.cmd(":MarkMarkNextCode<CR>"), desc = "Next Code Block" },
    { "[`", vim.cmd(":MarkMarkPrevCode<CR>"), desc = "Previous Code Block" },
    { "]|", vim.cmd(":MarkMarkNextTable<CR>"), desc = "Next Table" },
    { "[|", vim.cmd(":MarkMarkPrevTable<CR>"), desc = "Previous Table" },
}

return keys
