---@type table
local opts = {
    -- Path for the default .bib file to open
    -- TODO: Allow reading multiple files, make this an array.
    bibtex_path = nil,
    -- Directory where the current .bib file expects to be able to find external pdf files.
    pdf_dir = nil,
    -- Directory where you store your notes. Notes are expected to have the name of the citekey.
    notes_dir = nil,
    -- If you open a notes file (or the text file that is referenced by a bibentry itself),
    -- How do you want to open it?
    -- options: "current" (in current window), "hsplit", "vsplit"
    text_file_open_mode = "current",
}

return opts
