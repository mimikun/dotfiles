---@type LazyKeysSpec[]
local keys = {
    -- Config-switch
    {
        "<Leader>mU",
        mode = "n",
        desc = "toggle.switch_unmarked_only",
    },
    {
        "<Leader>mB",
        mode = "n",
        desc = "toggle.switch_blankhead_skip",
    },
    {
        "<Leader>mI",
        mode = "n",
        desc = "toggle.switch_inner_indent",
    },
    {
        "<Leader>mS",
        mode = "n",
        desc = "toggle.switch_auto_samestate",
    },
    {
        "<Leader>mL",
        mode = "n",
        desc = "toggle.switch_list_cycle",
    },
    {
        "<Leader>mX",
        mode = "n",
        desc = "toggle.switch_box_cycle",
    },
    -- Autolist
    {
        "O",
        mode = "n",
        desc = "toggle.autolist_up",
    },
    {
        "o",
        mode = "n",
        desc = "toggle.autolist_down",
    },
    {
        "<CR>",
        mode = "i",
        desc = "toggle.autolist_cr",
    },
    -- Normal mode
    {
        "<C-q>",
        mode = "n",
        desc = "toggle.quote_dot",
    },
    {
        "<C-l>",
        mode = "n",
        desc = "toggle.list_dot",
    },
    {
        "<C-n>",
        mode = "n",
        desc = "toggle.olist_dot",
    },
    {
        "<Leader><C-x>",
        mode = "n",
        desc = "toggle.checkbox_dot",
    },
    {
        "<C-h>",
        mode = "n",
        desc = "toggle.heading_dot",
    },
    -- Visual mode
    {
        "<C-q>",
        mode = "x",
        desc = "toggle.quote",
    },
    {
        "<C-l>",
        mode = "x",
        desc = "toggle.list",
    },
    {
        "<C-n>",
        mode = "x",
        desc = "toggle.olist",
    },
    {
        "<Leader><C-x>",
        mode = "x",
        desc = "toggle.checkbox",
    },
    {
        "<C-h>",
        mode = "x",
        desc = "toggle.heading",
    },
}
return keys
