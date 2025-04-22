---@type table
local cmds = {
    "DialIncrement",
    "DialDecrement",
}

---@type LazySpec
local spec = {
    "monaqa/dial.nvim",
    --lazy = false,
    cmd = cmds,
    keys = require("plugins.dial-nvim.keys"),
    event = "VeryLazy",
    config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group({
            default = {
                -- integer
                augend.integer.alias.decimal,
                augend.integer.alias.hex,
                -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
                augend.integer.new({
                    radix = 16,
                    prefix = "0x",
                    natural = true,
                    case = "upper",
                }),
                -- date
                -- date with format `yyyy/mm/dd`
                augend.date.new({
                    pattern = "%Y/%m/%d",
                    default_kind = "day",
                    -- if true, it does not match dates which does not exist, such as 2022/05/32
                    only_valid = true,
                    -- if true, it only matches dates with word boundary
                    word = false,
                }),
                augend.date.alias["%Y/%m/%d"],
                augend.date.new({
                    pattern = "%Y/%m/%d",
                    default_kind = "day",
                }),
                augend.date.new({
                    pattern = "%Y-%m-%d",
                    default_kind = "day",
                }),
                augend.date.new({
                    pattern = "%m/%d",
                    default_kind = "day",
                    only_valid = true,
                }),
                augend.date.new({
                    pattern = "%H:%M",
                    default_kind = "day",
                    only_valid = true,
                }),
                -- constant
                -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
                augend.constant.new({
                    elements = { "and", "or" },
                    word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
                    cyclic = true, -- "or" is incremented into "and".
                }),
                augend.constant.new({
                    elements = { "&&", "||" },
                    word = false,
                    cyclic = true,
                }),
                augend.constant.new({
                    elements = { "true", "false" },
                    cyclic = true,
                }),
                augend.constant.alias.ja_weekday_full,
                -- hexcolor
                -- hex colors (e.g. #1A1A1A, #EEFEFE, etc.)
                augend.hexcolor.new({
                    case = "upper", -- or "lower", "prefer_upper", "prefer_lower", see below
                }),
            },
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
