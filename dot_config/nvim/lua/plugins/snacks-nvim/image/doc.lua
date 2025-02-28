---@type table
local Doc = {
    -- enable image viewer for documents
    -- a treesitter parser must be available for the enabled languages.
    -- supported language injections: markdown, html
    enabled = true,
    -- render the image inline in the buffer
    -- if your env doesn't support unicode placeholders, this will be disabled
    -- takes precedence over `opts.float` on supported terminals
    inline = true,
    -- render the image in a floating window
    -- only used if `opts.inline` is disabled
    float = true,
    max_width = 80,
    max_height = 40,
}

return Doc
