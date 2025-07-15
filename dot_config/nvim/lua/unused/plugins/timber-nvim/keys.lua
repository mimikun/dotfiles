---@type LazyKeysSpec[]
local keys = {
    { "glj", desc = "Insert a log statement below the cursor" },
    { "glk", desc = "Insert a log statement above the cursor" },
    { "glo", desc = "Insert a plain log statement below the cursor" },
    { "gl<S-o>", desc = "Insert a plain log statement above the cursor" },
    { "glb", desc = "Insert a batch log statement" },
    { "gla", desc = "Add a log target to the batch" },
    { "g<S-l>j", desc = "insert_log_below_operator" },
    { "g<S-l>k", desc = "insert_log_above_operator" },
    { "g<S-l>b", desc = "insert_batch_log_operator" },
    { "g<S-l>a", desc = "add_log_targets_to_batch_operator" },
}

return keys
