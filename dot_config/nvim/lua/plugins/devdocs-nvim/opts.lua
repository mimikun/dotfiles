---@type table
local opts = {
    ensure_installed = {
        "go",
        "html",
        -- "dom",
        "http",
        -- "css",
        -- "javascript",
        -- "rust",
        -- some docs such as lua require version number along with the language name
        -- check `DevDocs install` to view the actual names of the docs
        "lua~5.1",
        -- "openjdk~21"
    },
}

return opts
