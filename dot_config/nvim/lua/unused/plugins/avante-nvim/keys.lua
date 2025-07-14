---@type LazyKeysSpec[]
local keys = {
    { "<leader>aa", desc = "show sidebar" },
    { "<leader>at", desc = "toggle sidebar visibility" },
    { "<leader>ar", desc = "refresh sidebar" },
    { "<leader>af", desc = "switch sidebar focus" },
    { "<leader>a?", desc = "select model" },
    { "<leader>ae", desc = "edit selected blocks" },
    { "<leader>aS", desc = "stop current AI request" },
    { "<leader>ah", desc = "select between chat histories" },
    { "co", desc = "choose ours" },
    { "ct", desc = "choose theirs" },
    { "ca", desc = "choose all theirs" },
    { "c0", desc = "choose none" },
    { "cb", desc = "choose both" },
    { "cc", desc = "choose cursor" },
    { "]x", desc = "move to previous conflict" },
    { "[x", desc = "move to next conflict" },
    { "[[", desc = "jump to previous codeblocks (results window)" },
    { "]]", desc = "jump to next codeblocks (results windows)" },
}

return keys
