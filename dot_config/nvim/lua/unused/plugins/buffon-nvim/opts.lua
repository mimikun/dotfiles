---@type string
local new_buffer_position
--new_buffer_position = "start"
new_buffer_position = "end"
--new_buffer_position = "after"

---@type BuffonConfig
local opts = {
    cyclic_navigation = true,
    new_buffer_position = new_buffer_position,
    num_pages = 2,
    open = {
        by_default = true,
        ignore_ft = {
            "gitcommit",
            "gitrebase",
        },
    },
    leader_key = ";",
    mapping_chars = "qweryuiop",
    keybindings = {
        goto_next_buffer = "<s-j>",
        goto_previous_buffer = "<s-k>",
        move_buffer_up = "<s-l>",
        move_buffer_down = "<s-h>",
        move_buffer_top = "<s-t>",
        move_buffer_bottom = "<s-b>",
        toggle_buffon_window = "<buffonleader>n",
        switch_previous_used_buffer = "<buffonleader><buffonleader>",
        close_buffer = "<buffonleader>d",
        close_buffers_above = "<buffonleader>v",
        close_buffers_below = "<buffonleader>b",
        close_all_buffers = "<buffonleader>cc",
        close_others = "<buffonleader>cd",
        reopen_recent_closed_buffer = "<buffonleader>t",
        show_help = "<buffonleader>h",
        previous_page = "<s-tab>",
        next_page = "<tab>",
        move_to_previous_page = "<buffonleader>a",
        move_to_next_page = "<buffonleader>s",
    },
}

return opts
