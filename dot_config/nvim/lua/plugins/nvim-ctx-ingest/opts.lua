---@type table
local opts = {
    window = {
        position = "float",
        width = 100,
        height = 40,
    },

    columns = {
        size = true,
        last_modified = true,
    },

    icons = {
        folder = {
            closed = "",
            open = "",
            empty = "",
            empty_open = "",
        },
        default = "",
        selected = "✓",
        unselected = " ",
    },

    max_file_size = 10 * 1024 * 1024,

    ignore_patterns = {
        "%.env",
        "^%.git/",
        "%.svn/",
        "%.hg/",
        "node_modules/",
        "target/",
        "dist/",
        "build/",
        "%.pyc$",
        "__pycache__/",
        "%.egg%-info/",
        "%.vscode/",
        "%.idea/",
        "%.DS_Store$",
        "%.gitignore",
        "%.lock",
        "%.png",
    },

    gitignore = {
        respect = true,
        auto_add = true,
    },
    patterns = {
        include = {},
        exclude = {},
    },

    output = {
        save_file = false,
        copy_clipboard = true,
    },
}

return opts
