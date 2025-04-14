---@type BibleReaderOptions
local opts = {
    translation = "en_kjv",
    language = "en",
    format = {
        max_line_length = 80,
        indent_size = 0,
        verse_spacing = 0,
        chapter_header = true,
        break_verses = true,
    },
}

return opts
