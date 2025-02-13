---@type table
local opts = {
    buffers = {
        right = {
            enabled = false,
        },
        scratchPad = {
            enabled = true,
            -- set to `nil` to saving cwd
            location = require("config.global").scratch_buf_dir,
        },
        bo = {
            filetype = "txt",
        },
    },
}

return opts
