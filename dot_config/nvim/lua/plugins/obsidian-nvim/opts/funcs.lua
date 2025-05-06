---@type table
local M = {}

-- Optional, customize how note IDs are generated given an optional title.
---@param title string|?
---@return string
M.note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
        end
    end
    return tostring(os.time()) .. "-" .. suffix
end

-- Optional, customize how note file names are generated given the ID, target directory, and title.
---@param spec { id: string, dir: obsidian.Path, title: string|? }
---@return string|obsidian.Path The full path to the new note.
M.note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
end

-- Optional, customize how wiki links are formatted. You can set this to one of:
-- _ "use_alias_only", e.g. '[[Foo Bar] ]'
-- _ "prepend*note_id", e.g. '[[foo-bar|Foo Bar] ]'
-- * "prepend*note_path", e.g. '[[foo-bar.md|Foo Bar] ]'
-- * "use_path_only", e.g. '[[foo-bar.md] ]'
-- Or you can set it to a function that takes a table of options and returns a string, like this:
M.wiki_link_func = function(opts)
    return require("obsidian.util").wiki_link_id_prefix(opts)
end

-- Optional, customize how markdown links are formatted.
M.markdown_link_func = function(opts)
    return require("obsidian.util").markdown_link(opts)
end

-- Optional, alternatively you can customize the frontmatter data.
---@return table
M.note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
        note:add_alias(note.title)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
            out[k] = v
        end
    end

    return out
end

-- Sets how you follow URLs
---@param url string
M.follow_url_func = function(url)
    vim.ui.open(url)
    -- vim.ui.open(url, { cmd = { "firefox" } })
end

-- Sets how you follow images
---@param img string
M.follow_img_func = function(img)
    vim.ui.open(img)
    -- vim.ui.open(img, { cmd = { "loupe" } })
end

return M
