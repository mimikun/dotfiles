---@type LazyKeysSpec[]
local keys = {
    { "<Leader>s", "<Plug>(REPLStart)", noremap = false, mode = "n" },
    { "<LocalLeader>o", "<Plug>(REPLStart-ipython)", noremap = false, ft = "python", mode = "n" },
}

return keys
