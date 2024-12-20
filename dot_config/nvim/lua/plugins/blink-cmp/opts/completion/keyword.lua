local keyword = {
    -- 'prefix' will fuzzy match on the text before the cursor
    -- 'full' will fuzzy match on the text before *and* after the cursor
    -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
    range = "prefix",
    -- Regex used to get the text when fuzzy matching
    regex = "[-_]\\|\\k",
    -- After matching with regex, any characters matching this regex at the prefix will be excluded
    exclude_from_prefix_regex = "[\\-]",
}

return keyword
