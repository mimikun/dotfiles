---@type table
local opts = {
    auto_attach = true,
    auto_enable = false,
    idle_time = 500,
    client = {
        on_attach = function(_, buffer)
            vim.keymap.set("n", "<leader>o", function()
                require("rustowl").toggle(buffer)
            end, { buffer = buffer, desc = "Toggle RustOwl" })
        end,
    },
}

---@type LazySpec
local spec = {
    "cordx56/rustowl",
    --build = "cd rustowl && cargo install --path . --locked",
    -- NOTE: This plugin is already lazy
    lazy = false,
    cmd = "Rustowl",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
