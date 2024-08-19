---@type table
local cmds = {
    "IlluminatePause",
    "IlluminateResume",
    "IlluminateToggle",
    "IlluminatePauseBuf",
    "IlluminateResumeBuf",
    "IlluminateToggleBuf",
}

---@type table
local opts = {
    filetypes_denylist = {
        "dirbuf",
        "dirvish",
        "fugitive",
    },
    -- sets regex case sensitivity
    case_insensitive_regex = false,
}

---@type LazySpec
local spec = {
    "RRethy/vim-illuminate",
    --lazy = false,
    cmd = cmds,
    config = function()
        require("illuminate").configure(opts)
    end,
    --cond = false,
}

return spec
