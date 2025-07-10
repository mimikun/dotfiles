---@type table
local tabline = {
    left = {
        "bufinfo",
        "parent",
        "shellslash",
        " ",
    },
    right = {},
    view = {
        "buffers",
        "tabs",
    },
    bufinfo = {
        "%#StabaTabsReverse#",
        "tab",
        "%#StabaBuffersReverse#",
        "buffer",
        "%#StabaModified#",
        "modified",
        "%#StabaSpecial#",
        "unopened",
        "%* ",
    },
    active = {
        "devicon",
        "namestate",
    },
}

return tabline
