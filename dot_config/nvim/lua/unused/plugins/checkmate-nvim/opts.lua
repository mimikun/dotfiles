---@type checkmate.Config
local opts = {
    default_list_marker = "-",
    todo_markers = {
        unchecked = "□",
        checked = "✔",
    },
    enter_insert_after_new = true,
    todo_action_depth = 1,
}

return opts
