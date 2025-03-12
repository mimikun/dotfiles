local import_config = {
    -- Imports can be added at a specified line whilst keeping the cursor in place
    insert_at_top = true,
    -- Optionally support additional languages or modify existing languages...
    custom_languages = {
        {
            -- The filetypes that ripgrep supports (find these via `rg --type-list`)
            extensions = { "js", "ts" },
            -- The Vim filetypes
            filetypes = { "vue" },
            -- Optionally set a line other than 1
            insert_at_line = 2, ---@type function|number,
            -- The regex pattern for the import statement
            regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
        },
    },
}

return import_config
