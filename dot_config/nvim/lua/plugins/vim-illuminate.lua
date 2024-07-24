---@type table
local cmds = {
    "IlluminatePause",
    "IlluminatePauseBuf",
    "IlluminateResume",
    "IlluminateResumeBuf",
    "IlluminateToggle",
    "IlluminateToggleBuf",
    "IlluminateDebug",
}

---@type LazySpec
local spec = {
    "RRethy/vim-illuminate",
    --lazy = false,
    cmd = cmds,
    config = function()
        require("illuminate").configure({
            -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
            filetypes_denylist = {
                "dirvish",
                "fugitive",
            },
        })
    end,
    --cond = false,
}

return spec
