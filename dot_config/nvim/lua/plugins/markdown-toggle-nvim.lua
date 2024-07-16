-- TODO: settings

---@type table
local opts = {
    -- If true, the auto-setup for the default keymaps is enabled
    use_default_keymaps = false,
    -- The keymaps are valid only for these filetypes
    filetypes = { "markdown", "markdown.mdx" },

    -- Cycle the marks in user-defined table when toggling lists
    enable_list_cycle = false,
    -- The list marks table used in cycle-mode (list_table[1] is used as the default list-mark)
    list_table = { "-", "+", "*", "=" },

    -- Cycle the marks in user-defined table when toggling checkboxes
    enable_box_cycle = false,
    -- The checkbox marks table used in cycle-mode (box_table[1] is used as the default checked-state)
    box_table = { "x", "~", "!", ">" },

    -- Mimic the behavior of Obsidian's "Toggle bullet list" on `list()`
    mimic_obsidian_list = true,
    -- Mimic the behavior of Obsidian's "Cycle bullet/checkbox" on `checkbox()`
    mimic_obsidian_cycle = true,

    -- The heading marks table used in `markdown-toggle.heading`
    heading_table = { "#", "##", "###", "####", "#####" },

    -- Skip blank lines and headings in Visual mode (except for quotes)
    enable_blankhead_skip = true,
    -- Insert an indented quote for new lines within quoted text
    enable_inner_indent = false,
    -- Toggle only unmarked lines first
    enable_unmarked_only = true,
    -- Automatically continue lists on new lines
    enable_autolist = true,
    -- Maintain checkbox state when continuing lists
    enable_auto_samestate = false,
    -- Dot-repeat for toggle functions in Normal mode
    enable_dot_repeat = true,
}

---@type LazySpec
local spec = {
    "roodolv/markdown-toggle.nvim",
    --lazy = false,
    opts = opts,
    --require("markdown-toggle").setup(opts)
    --cond = false,
}

return spec
