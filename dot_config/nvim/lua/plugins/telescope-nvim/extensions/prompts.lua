---@type table
local prompts_dirs = {
    vim.fn.expand("~/.config/nvim/prompts"),
    vim.fn.expand("~/my-prompts"),
}

---@type table
local prompts_config = {
    dirs = prompts_dirs,
    command = "AvanteEdit",
    file_extensions = { "md", "txt" },
    accept_all_files = false,
    sort_by = "name",
    --sort_by = "modified",
    tail_path = false,
    shorten_path = true,
    previewer = true,
    theme = "dropdown",
    --theme = "cursor",
    --theme = "ivy",
    layout_strategy = "flex",
    layout_config = {
        height = 0.95,
        width = 0.95,
        preview_width = 0.6,
    },
}

return prompts_config
