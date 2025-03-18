---@type table
local key_opts = { noremap = true, silent = true }

---@type LazyKeysSpec[]
local keys = {
    {
        "<Leader>cb",
        "<Cmd>CBllbox<CR>",
        mode = { "n", "v" },
        desc = "left aligned fixed size box with left aligned text",
        key_opts,
    },
    {
        "<Leader>cc",
        "<Cmd>CBacbox<CR>",
        mode = { "n", "v" },
        desc = "centered adapted box",
        key_opts,
    },
    {
        "<Leader>ct",
        "<Cmd>llline<CR>",
        mode = { "n", "v" },
        desc = "left aligned titled line with left aligned text",
        key_opts,
    },
    {
        "<Leader>cl",
        "<Cmd>CBline<CR>",
        mode = "n",
        desc = "centered line",
        key_opts,
    },
    {
        "<M-l>",
        "<Cmd>CBline<CR>",
        mode = "i",
        desc = "centered line",
        key_opts,
    },
    {
        "<Leader>cd",
        "<Cmd>CBd<CR>",
        mode = { "n", "v" },
        desc = "remove a box or a titled line",
        key_opts,
    },
}

return keys
