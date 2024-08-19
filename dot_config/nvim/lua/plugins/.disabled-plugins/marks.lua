---@type table
local cmds = {
    "MarksToggleSigns",
    "MarksListBuf",
    "MarksListGlobal",
    "MarksListAll",
    "BookmarksList group_number",
    "BookmarksListAll",
    "MarksQFListBuf",
    "MarksQFListGlobal",
    "MarksQFListAll",
    "BookmarksQFList group_number",
    "BookmarksQFListAll",
}

---@type LazySpec
local spec = {
    "chentoast/marks.nvim",
    --lazy = false,
    cmd = cmds,
    --keys = "",
    opts = {
        builtin_marks = {
            "'",
            "^",
            ".",
            "<",
            ">",
        },
        default_mappings = true,
        signs = true,
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 150,
        sign_priority = 10,
        excluded_filetypes = {},
        excluded_buftypes = {},
        mappings = {},
    },
    --cond = false,
    enabled = false,
}

return spec
