---@type table
local cmds = {
    -- resize
    "SmartResizeLeft",
    "SmartResizeRight",
    "SmartResizeUp",
    "SmartResizeDown",
    -- move
    "SmartCursorMoveLeft",
    "SmartCursorMoveRight",
    -- same_row does not apply to up/down
    "SmartCursorMoveUp",
    "SmartCursorMoveDown",
    -- swap
    "SmartSwapLeft",
    "SmartSwapRight",
    -- same_row does not apply to up/down
    "SmartSwapUp",
    "SmartSwapDown",
    -- resize mode
    "SmartResizeMode",
    "SmartSplitsLog",
    "SmartSplitsLogLevel",
}

return cmds
