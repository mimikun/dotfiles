---@class snacks.picker.previewers.Config
local previewers = {
    git = {
        -- use native (terminal) or Neovim for previewing git diffs and commits
        native = false,
    },
    file = {
        -- 1MB
        max_size = 1024 * 1024,
        -- max line length
        max_line_length = 500,
        ---@type string? filetype for highlighting. Use `nil` for auto detect
        ft = nil,
    },
    ---@type string? MANPAGER env to use for `man` preview
    man_pager = nil,
}

return previewers
