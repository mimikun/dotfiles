-- window options applied to windows displaying image buffers
-- an image buffer is a buffer with `filetype=image`
---@type vim.wo|{} options for windows showing the image
local Window_options = {
    wrap = false,
    number = false,
    relativenumber = false,
    cursorcolumn = false,
    signcolumn = "no",
    foldcolumn = "0",
    list = false,
    spell = false,
    statuscolumn = "",
}

return Window_options
