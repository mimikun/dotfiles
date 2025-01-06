local global = require("config.global")

---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-telekasten/calendar-vim",
}

---@type LazySpec
local spec = {
    "renerocksai/telekasten.nvim",
    --lazy = false,
    --ft = "",
    cmd = "Telekasten",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        local home = global.is_windows and "C:/Users/USERNAME/zettelkasten" or vim.fn.expand("~/zettelkasten")

        require("telekasten").setup({

            -- Main paths
            home = home,
            dailies = home,
            weeklies = home,
            templates = home,

            -- Specific note templates
            -- set to `nil` or do not specify if you do not want a template
            template_new_note = "/path/to/file", -- template for new notes
            --[[
template_new_note: ~
    Markdown template for new notes. Set to `nil` if you don't want a
    template.

    Default: `nil`
    Example: `'vim.fn.expand("~/zettelkasten/templates/basenote.md")'`
]]
            template_new_daily = "/path/to/file", -- template for new daily notes
            --[[
template_new_daily: ~
    Markdown template for new daily notes. Set to `nil` if you don't want
    a template.

    Default: `nil`
    Example: `'vim.fn.expand("~/zettelkasten/templates/daily.md")'`
]]
            template_new_weekly = "/path/to/file", -- template for new weekly notes
            --[[
template_new_weekly: ~
    Markdown template for new weekly notes. Set to `nil` if you don't want
    a template.

    Default: `nil`
    Example: `'vim.fn.expand("~/zettelkasten/templates/weekly.md")'`
]]

            -- Image subdir for pasting
            -- subdir name
            -- or nil if pasted images shouldn't go into a special subdir
            image_subdir = "img",
            --[[
image_subdir: ~
    Path to the directory where pasted images should go to. Accepts
    absolute path or sub-directory name.
    Set to `nil` if images should not go into a sub-directory.

    Default: `nil`
]]

            -- File extension for note files
            extension = ".md",
            --[[
extension: ~
    Filename extension of your markdown note files.

    Default: '.md'
]]

            -- Generate note filenames. One of:
            -- "title" (default) - Use title if supplied, uuid otherwise
            -- "uuid" - Use uuid
            -- "uuid-title" - Prefix title by uuid
            -- "title-uuid" - Suffix title with uuid
            new_note_filename = "title",
            --[[
new_note_filename: ~
    Configures the filenames of newly created notes. See |uuid_sep|
    for 'uuid-title' and 'title-uuid' separator.

    Valid options are:
    - 'title' .. title only
    - 'uuid' .. uuid only
    - 'uuid-title' .. prefix title by uuid
    - 'title-uuid' .. suffix title with uuid

    Default: 'title'
]]

            -- Flags for creating non-existing notes
            follow_creates_nonexisting = true, -- create non-existing on follow
            --[[
follow_creates_nonexisting: ~
    Flag that determines whether non-existing notes should be created when
    following a link to them.

    Default: true
]]
            dailies_create_nonexisting = true, -- create non-existing dailies
            --[[
dailies_create_nonexisting: ~
    Flag that determines whether today's note should always be created if
    not present. Also, whether daily notes should be created when opening
    them via the calendar.

    Default: true
]]
            weeklies_create_nonexisting = true, -- create non-existing weeklies
            --[[
weeklies_create_nonexisting: ~
    Flag that determines whether this week's note should always be created
    if not present. Also, whether weekly notes should be created when
    opening them via the calendar.

    Default: true
]]

            -- skip telescope prompt for goto_today and goto_thisweek
            journal_auto_open = false,
            --[[
journal_auto_open: ~
    Flag that determines whether the telescope picker should be used when
    opening the daily and weekly notes, or if they should be directly
    created/opened.

    Default: false
]]

            -- Image link style",
            -- wiki:     ![ [image name] ]
            -- markdown: ![](image_subdir/xxxxx.png)
            image_link_style = "wiki",
            --[[
image_link_style: ~
    Style of links to insert when pasting an image.

    Valid options are:
    - 'wiki' .. places links like this: `![ [image_name] ]`
    - 'markdown' .. `![](image_subdir/image_name)`

    Default: 'markdown'
]]

            -- Default sort option: 'filename', 'modified'
            sort = "filename",
            --[[
sort: ~
    Order the notes by the option.

    Valid options are:
    - 'filename'
    - 'modified'

    Default: 'filename'
]]

            -- Make syntax available to markdown buffers and telescope previewers
            install_syntax = true,
            --[[
install_syntax:~
    If `true`, telekasten's syntax for links, tags, etc. will be used for
    markdown files, also in telescope previewers. Your configured markdown
    syntax will be inherited, though.

    Default: `true`
]]

            -- Tag notation: '#tag', '@tag', ':tag:', 'yaml-bare'
            tag_notation = "#tag",
            --[[
tag_notation:~
    The tag style you want to use.

    Valid options are:
    - `'#tag'`
    - `'@tag'`
    - `':tag:'`
    - `'yaml-bare'`

    Default: `#tag`

    See |telekasten.tag_notation| for more information.
]]

            -- When linking to a note in subdir/, create a [ [subdir/title] ] link
            -- instead of a [ [title only] ] link
            subdirs_in_links = true,
            --[[
subdirs_in_links:~
    Include subdirs (if applicable) in generated (yanked, inserted) links.

    Default: `true`
]]

            -- Command palette theme: dropdown (window) or ivy (bottom panel)
            command_palette_theme = "ivy",

            -- Tag list theme:
            -- get_cursor (small tag list at cursor)
            -- dropdown (window)
            -- ivy (bottom panel)
            show_tags_theme = "ivy",

            -- Previewer for media files (images mostly)
            -- "telescope-media-files" if you have telescope-media-files.nvim installed
            -- "catimg-previewer" if you have catimg installed
            -- "viu-previewer" if you have viu installed
            media_previewer = "telescope-media-files",
            --[[
media_previewer:~
    Previewer used for viewing media / image files. There are three
    options:
    - `'telescope-media-files'` : use the telescope-media-files.nvim
      plugin
    - `'catimg-previewer'` : use the built-in `catimg` previewer.
      Requires `catimg` to be installed.
    - `'viu-previewer'` : use the built-in `viu` previewer.
      Requires `viu` to be installed.

    Default: `telescope-media-files`
]]

            -- Customize insert image and preview image files list. This is useful
            -- to add optional filetypes into filtered list (for example
            -- telescope-media-files optionally supporting svg preview)
            media_extensions = {
                ".png",
                ".jpg",
                ".bmp",
                ".gif",
                ".pdf",
                ".mp4",
                ".webm",
                ".webp",
            },

            -- Calendar integration
            plug_into_calendar = true, -- use calendar integration
            calendar_opts = {
                weeknm = 4, -- calendar week display mode:
                --[[
weeknm: ~
    Integer that defines the format of how calendar weeks should be
    labeled.

    Valid values are:
    - 1 -> `WK01`
    - 2 -> `WK 1`
    - 3 -> `KW01`
    - 4 -> `KW 1`
    - 5 -> `1`

    Default: 4
]]
                --   1 .. 'WK01'
                --   2 .. 'WK 1'
                --   3 .. 'KW01'
                --   4 .. 'KW 1'
                --   5 .. '1'

                calendar_monday = 1, -- use monday as first day of week:
                --[[
calendar_monday: ~
    Set this to 1 if you want weeks to start on Mondays.

    Valid values are:
    - 0 -> weeks start on Sundays
    - 1 -> weeks start on Mondays

    Default: 1
]]
                --   1 .. true
                --   0 .. false

                calendar_mark = "left-fit", -- calendar mark placement
                --[[
calendar_mark: ~
    Where to place marks such as `+` and `*`, relative to the day.

    Valid values are:
    - 'left'     ->  ugly
    - 'right'    ->  right to the day
    - 'left-fit' -> left of the day

    Default: 'left-fit'
]]
                -- where to put mark for marked days:
                --   'left'
                --   'right'
                --   'left-fit'
            },

            vaults = {
                personal = {
                    -- configuration for personal vault. E.g.:
                    -- home = "/home/user/vaults/personal",
                },
            },

            -- Specify a clipboard program to use
            clipboard_program = "", -- xsel, xclip, wl-paste, osascript
        })
    end,
    cond = false,
    enabled = false,
}

return spec

-- TODO: its
--[[
follow_url_fallback:~
    A customizable fallback handler for urls.
    When it set to nil, Telekasten will use `xdg-open` or `open`

    Default: `nil`
    Example: `"call jobstart('firefox --new-window {{url}}')"`
]]
--[[
enable_create_new: ~
    Flag that determines if creating new notes with <C-n> in enabled when
    using the `find_notes` picker.

    Default: true
]]
--[[
template_handling:~
    Strategy for telekasten to pick a template when a new note is created
    via `new_note()`, or by `follow_link()` to a non-existing note.

    Valid options are:
    - `'smart'`:     if day or week is detected in title, use daily / weekly
                   templates, else the new note template.

    - `'prefer_new_note'`: use the new note template.

    - `'always_ask'`: always ask for a template via template picker.

    Default: `smart`
]]
--[[
new_note_location:~
    Path handling for `new_note()`, `new_templated_note()`, `follow_link()`
    to non-existing note.

    Valid options are:
    - `'smart'`: put daily-looking (date as title) into the daily folder,
               weekly-looking notes into the weekly folder, all other notes
               into the home folder, except for notes with `sub/folders` in
               the title.

    - `'prefer_home'`: put all notes in home folder except for
                     `goto_today()` and `goto_thisweek()`, and notes with
                     `sub/folders` in the title.

    - `'same_as_current'`: put all new notes in the directory of the
                         currently open note (where the cursor is) if
                         present or else into the home folder, except for
                         notes with `sub/folders` in the title.

    Default: `smart`
]]
--[[
rename_update_links:~
    If `true`, telekasten will automatically update the links after a file
    has been renamed.

    Default: `true`
]]
--[[
filename_small_case: ~
    When the note title is used within the filename, i.e.
    |new_note_filename| contains 'title', the tile will be 
    made lowercase.

    e.g. if set to true, '20230103-My New Note Title.md' would instead
    become '20230103-my new note title.md'

    If set to `false`, no substitution will occur.

Default: `false`
]]
--[[
filename_space_subst: ~
    When the note title is used within the filename, i.e.
    |new_note_filename| contains 'title', spaces in the title will be
    substituted for |filename_space_subst|.

    e.g. if set to '_', '20230103-my new note title.md' would instead
    become '20230103-my_new_note_title.md'

    If set to `nil`, no substitution will occur.

    Default: `nil`
]]
--[[
take_over_my_home: ~
    If set to `true`, telekasten.nvim will take over your home. Any notes
    from the configured `home` directory will receive a `set`
    `filetype=telekasten`, no matter if opened by telekasten or another
    way.

    Default: `true`
]]
--[[
auto_set_filetype: ~
    If `false`, the telekasten filetype will not be set. Markdown
    files will get the markdown filetype.
 
    Default: `true`
]]
--[[
auto_set_syntax: ~
    If `false`, the telekasten syntax will not be set.

    Default: `true`
]]
