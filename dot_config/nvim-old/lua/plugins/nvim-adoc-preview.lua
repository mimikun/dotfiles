---@type table
local cmds = {
    "AsciiDocPreview",
    "AsciiDocPreviewStop",
    "AsciiDocPreviewOpen",
    "AsciiDocPreviewNotify",
}

---@type LazySpec
local spec = {
    "tigion/nvim-asciidoc-preview",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    ft = "asciidoc",
    build = "cd server && npm install",
    opts = {
        server = {
            -- `js` or `cmd`
            converter = "js",
            port = 11235,
        },
        preview = {
            -- `current`, `start`, `sync`
            position = "current",
        },
    },
    --config = true,
    --cond = false,
}

return spec
