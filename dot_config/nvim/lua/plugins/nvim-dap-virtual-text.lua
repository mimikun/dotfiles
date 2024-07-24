---@type table
local cmds = {
    "DapVirtualTextEnable",
    "DapVirtualTextDisable",
    "DapVirtualTextToggle",
    "DapVirtualTextForceRefresh",
}

---@type table
local dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
}

---@type table
local opts = {
    -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    enabled_commands = true,
    -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    highlight_new_as_changed = false,
    -- prefix virtual text with comment string
    commented = false,
    -- show virtual text on all all references of the variable (not only definitions)
    all_references = false,
    -- clear virtual text on "continue" (might cause flickering when stepping)
    clear_on_continue = false,
    -- experimental features:
    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    all_frames = false,
    -- show virtual lines instead of virtual text (will flicker!)
    virt_lines = false,
    -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    virt_text_win_col = nil,
}

---@type LazySpec
local spec = {
    "theHamsta/nvim-dap-virtual-text",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
