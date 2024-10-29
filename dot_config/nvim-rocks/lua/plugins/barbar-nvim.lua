vim.g.barbar_auto_setup = false

---@type table
local opts = {
    exclude_ft = {},
}

require("barbar").setup(opts)

---@type table
local key_opts = {
    noremap = true,
    silent = true,
    --expr = true,
}

vim.keymap.set("n", "<leader>,", function()
    vim.cmd("BufferPrevious")
end, key_opts)

vim.keymap.set("n", "<leader>.", function()
    vim.cmd("BufferNext")
end, key_opts)

vim.keymap.set("n", "<leader><", function()
    vim.cmd("BufferMovePrevious")
end, key_opts)

vim.keymap.set("n", "<leader>>", function()
    vim.cmd("BufferMoveNext")
end, key_opts)

vim.keymap.set("n", "<leader>b1", function()
    vim.cmd("BufferGoto 1")
end, key_opts)

vim.keymap.set("n", "<leader>b2", function()
    vim.cmd("BufferGoto 2")
end, key_opts)

vim.keymap.set("n", "<leader>b3", function()
    vim.cmd("BufferGoto 3")
end, key_opts)

vim.keymap.set("n", "<leader>b4", function()
    vim.cmd("BufferGoto 4")
end, key_opts)

vim.keymap.set("n", "<leader>b5", function()
    vim.cmd("BufferGoto 5")
end, key_opts)

vim.keymap.set("n", "<leader>b6", function()
    vim.cmd("BufferGoto 6")
end, key_opts)

vim.keymap.set("n", "<leader>b7", function()
    vim.cmd("BufferGoto 7")
end, key_opts)

vim.keymap.set("n", "<leader>b8", function()
    vim.cmd("BufferGoto 8")
end, key_opts)

vim.keymap.set("n", "<leader>b9", function()
    vim.cmd("BufferGoto 9")
end, key_opts)

vim.keymap.set("n", "<leader>b$", function()
    vim.cmd("BufferLast")
end, key_opts)

vim.keymap.set("n", "<leader>p", function()
    vim.cmd("BufferPin")
end, key_opts)

vim.keymap.set("n", "<leader>c", function()
    vim.cmd("BufferClose")
end, key_opts)

vim.keymap.set("n", "<leader>sc", function()
    vim.cmd("BufferRestore")
end, key_opts)

vim.keymap.set("n", "<C-p>", function()
    vim.cmd("BufferPick")
end, key_opts)

vim.keymap.set("n", "<C-p>", function()
    vim.cmd("BufferPickDelete")
end, key_opts)

vim.keymap.set("n", "<leader>bb", function()
    vim.cmd("BufferOrderByBufferNumber")
end, key_opts)

vim.keymap.set("n", "<leader>bn", function()
    vim.cmd("BufferOrderByName")
end, key_opts)

vim.keymap.set("n", "<leader>bd", function()
    vim.cmd("BufferOrderByDirectory")
end, key_opts)

vim.keymap.set("n", "<leader>bl", function()
    vim.cmd("BufferOrderByLanguage")
end, key_opts)

vim.keymap.set("n", "<leader>bw", function()
    vim.cmd("BufferOrderByWindowNumber")
end, key_opts)
