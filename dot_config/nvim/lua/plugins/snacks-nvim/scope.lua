---@class snacks.scope.Config
---@field max_size? number
---@field enabled? boolean
local Config = {
    enabled = false,
    -- absolute minimum size of the scope.
    -- can be less if the scope is a top-level single line scope
    min_size = 2,
    -- try to expand the scope to this size
    max_size = nil,
    -- when true, the column of the cursor is used to determine the scope
    cursor = true,
    -- include the edge of the scope (typically the line above and below with smaller indent)
    edge = true,
    -- expand single line scopes with single line siblings
    siblings = false,
    -- what buffers to attach to
    filter = function(buf)
        return vim.bo[buf].buftype == ""
    end,
    -- debounce scope detection in ms
    debounce = 30,
    treesitter = {
        -- detect scope based on treesitter.
        -- falls back to indent based detection if not available
        enabled = true,
        -- include language injections when detecting scope (useful for languages like `vue`)
        injections = true,
        ---@type string[]|{enabled?:boolean}
        blocks = {
            -- enable to use the following blocks
            enabled = false,
            "function_declaration",
            "function_definition",
            "method_declaration",
            "method_definition",
            "class_declaration",
            "class_definition",
            "do_statement",
            "while_statement",
            "repeat_statement",
            "if_statement",
            "for_statement",
        },
        -- these treesitter fields will be considered as blocks
        field_blocks = {
            "local_declaration",
        },
    },
    -- These keymaps will only be set if the `scope` plugin is enabled.
    -- Alternatively, you can set them manually in your config,
    -- using the `Snacks.scope.textobject` and `Snacks.scope.jump` functions.
    keys = {
        ---@type table<string, snacks.scope.TextObject|{desc?:string}>
        textobject = {
            ii = {
                -- minimum size of the scope
                min_size = 2,
                -- inner scope
                edge = false,
                cursor = false,
                treesitter = { blocks = { enabled = false } },
                desc = "inner scope",
            },
            ai = {
                cursor = false,
                -- minimum size of the scope
                min_size = 2,
                treesitter = { blocks = { enabled = false } },
                desc = "full scope",
            },
        },
        ---@type table<string, snacks.scope.Jump|{desc?:string}>
        jump = {
            ["[i"] = {
                -- allow single line scopes
                min_size = 1,
                bottom = false,
                cursor = false,
                edge = true,
                treesitter = { blocks = { enabled = false } },
                desc = "jump to top edge of scope",
            },
            ["]i"] = {
                -- allow single line scopes
                min_size = 1,
                bottom = true,
                cursor = false,
                edge = true,
                treesitter = { blocks = { enabled = false } },
                desc = "jump to bottom edge of scope",
            },
        },
    },
}

return Config
