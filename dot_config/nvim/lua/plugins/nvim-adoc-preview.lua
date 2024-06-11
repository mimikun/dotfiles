---@type table
local cmds = {
    "AsciiDocPreview",
    "AsciiDocPreviewStop",
    "AsciiDocPreviewOpen",
    "AsciiDocPreviewNotify",
}

---@type table
local opts = {
    server = {
        -- `js` or `cmd`
        converter = "js",
        port = 11235,
    },
    preview = {
        -- `current`, `start`, `sync`
        position = "current",
    },
}

---@type LazySpec
local spec = {
    "tigion/nvim-asciidoc-preview",
    --lazy = false,
    cmd = cmds,
    ft = "asciidoc",
    build = "cd server && npm install",
    opts = opts,
    --cond = false,
}

return spec
