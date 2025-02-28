---@class snacks.image.Config
---@field enabled? boolean enable image viewer
---@field wo? vim.wo|{} options for windows showing the image
---@field bo? vim.bo|{} options for the image buffer
---@field formats? string[]
--- Resolves a reference to an image with src in a file (currently markdown only).
--- Return the absolute path or url to the image.
--- When `nil`, the path is resolved relative to the file.
---@field resolve? fun(file: string, src: string): string?
---@field convert? snacks.image.convert.Config
local Config = {
    enabled = true,
    formats = require("plugins.snacks-nvim.image.formats"),
    -- try displaying the image, even if the terminal does not support it
    force = false,
    doc = require("plugins.snacks-nvim.image.doc"),
    img_dirs = require("plugins.snacks-nvim.image.img-dirs"),
    -- window options applied to windows displaying image buffers
    -- an image buffer is a buffer with `filetype=image`
    wo = require("plugins.snacks-nvim.image.window-options"),
    cache = vim.fn.stdpath("cache") .. "/snacks/image",
    debug = {
        request = false,
        convert = false,
        placement = false,
    },
    env = {},
    convert = require("plugins.snacks-nvim.image.convert"),
}

return Config
