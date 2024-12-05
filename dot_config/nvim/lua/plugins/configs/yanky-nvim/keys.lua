---@type table
local n_x_mode = { "n", "x" }

local keys = {
    {
        "<leader>P",
        function()
            require("telescope").extensions.yank_history.yank_history({})
        end,
        desc = "Open Yank History",
    },
    {
        "y",
        "<Plug>(YankyYank)",
        mode = n_x_mode,
        desc = "Yank text",
    },
    {
        "p",
        "<Plug>(YankyPutAfter)",
        mode = n_x_mode,
        desc = "Put yanked text after cursor",
    },
    {
        "P",
        "<Plug>(YankyPutBefore)",
        mode = n_x_mode,
        desc = "Put yanked text before cursor",
    },
    {
        "gp",
        "<Plug>(YankyGPutAfter)",
        mode = n_x_mode,
        desc = "Put yanked text after selection",
    },
    {
        "gP",
        "<Plug>(YankyGPutBefore)",
        mode = n_x_mode,
        desc = "Put yanked text before selection",
    },
    {
        "<c-p>",
        "<Plug>(YankyPreviousEntry)",
        desc = "Select previous entry through yank history",
    },
    {
        "<c-n>",
        "<Plug>(YankyNextEntry)",
        desc = "Select next entry through yank history",
    },
    {
        "]p",
        "<Plug>(YankyPutIndentAfterLinewise)",
        desc = "Put indented after cursor (linewise)",
    },
    {
        "[p",
        "<Plug>(YankyPutIndentBeforeLinewise)",
        desc = "Put indented before cursor (linewise)",
    },
    {
        "]P",
        "<Plug>(YankyPutIndentAfterLinewise)",
        desc = "Put indented after cursor (linewise)",
    },
    {
        "[P",
        "<Plug>(YankyPutIndentBeforeLinewise)",
        desc = "Put indented before cursor (linewise)",
    },
    {
        ">p",
        "<Plug>(YankyPutIndentAfterShiftRight)",
        desc = "Put and indent right",
    },
    {
        "<p",
        "<Plug>(YankyPutIndentAfterShiftLeft)",
        desc = "Put and indent left",
    },
    {
        ">P",
        "<Plug>(YankyPutIndentBeforeShiftRight)",
        desc = "Put before and indent right",
    },
    {
        "<P",
        "<Plug>(YankyPutIndentBeforeShiftLeft)",
        desc = "Put before and indent left",
    },
    {
        "=p",
        "<Plug>(YankyPutAfterFilter)",
        desc = "Put after applying a filter",
    },
    {
        "=P",
        "<Plug>(YankyPutBeforeFilter)",
        desc = "Put before applying a filter",
    },
}

return keys
