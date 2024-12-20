local list = {
    -- Maximum number of items to display
    max_items = 200,
    -- Controls if completion items will be selected automatically,
    -- and whether selection automatically inserts
    selection = "preselect",
    -- Controls how the completion items are selected
    -- 'preselect' will automatically select the first item in the completion list
    -- 'manual' will not select any item by default
    -- 'auto_insert' will not select any item by default, and insert the completion items automatically
    -- when selecting them
    --
    -- You may want to bind a key to the `cancel` command, which will undo the selection
    -- when using 'auto_insert'
    cycle = {
        -- When `true`, calling `select_next` at the *bottom* of the completion list
        -- will select the *first* completion item.
        from_bottom = true,
        -- When `true`, calling `select_prev` at the *top* of the completion list
        -- will select the *last* completion item.
        from_top = true,
    },
}

return list
