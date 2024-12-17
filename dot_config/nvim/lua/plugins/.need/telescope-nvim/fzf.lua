local ext = {
    -- false will only do exact matching
    fuzzy = true,
    -- override the generic sorter
    override_generic_sorter = true,
    -- override the file sorter
    override_file_sorter = true,
    -- or "ignore_case" or "respect_case"
    case_mode = "smart_case",
    --case_mode = "ignore_case",
    --case_mode = "respect_case",
}

return ext
