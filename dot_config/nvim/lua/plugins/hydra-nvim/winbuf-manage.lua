-- NOTE: need install and enable its
-- https://github.com/romgrk/barbar.nvim
-- https://github.com/jlanzarotta/bufexplorer
-- https://github.com/sindrets/winshift.nvim
-- https://github.com/mrjones2014/smart-splits.nvim
-- https://github.com/anuvyklack/windows.nvim

local Hydra = require("hydra")
local splits = require("smart-splits")

local keymap_util = require("hydra.keymap-util")
local cmd = keymap_util.cmd
local pcmd = keymap_util.pcmd

local buffer_hydra = Hydra({
    name = "Barbar",
    config = {
        on_key = function()
            -- Preserve animation
            vim.wait(200, function()
                vim.cmd("redraw")
            end, 30, false)
        end,
    },
    heads = {
        {
            "h",
            function()
                -- barbar.nvim
                vim.cmd("BufferPrevious")
            end,
            { on_key = false },
        },
        {
            "l",
            function()
                -- barbar.nvim
                vim.cmd("BufferNext")
            end,
            { desc = "choose", on_key = false },
        },

        {
            "H",
            function()
                -- barbar.nvim
                vim.cmd("BufferMovePrevious")
            end,
        },
        {
            "L",
            function()
                -- barbar.nvim
                vim.cmd("BufferMoveNext")
            end,
            { desc = "move" },
        },

        {
            "p",
            function()
                -- barbar.nvim
                vim.cmd("BufferPin")
            end,
            { desc = "pin" },
        },

        {
            "d",
            function()
                -- barbar.nvim
                vim.cmd("BufferClose")
            end,
            { desc = "close" },
        },
        {
            "c",
            function()
                -- barbar.nvim
                vim.cmd("BufferClose")
            end,
            { desc = false },
        },
        {
            "q",
            function()
                -- barbar.nvim
                vim.cmd("BufferClose")
            end,
            { desc = false },
        },

        {
            "od",
            function()
                -- barbar.nvim
                vim.cmd("BufferOrderByDirectory")
            end,
            { desc = "by directory" },
        },
        {
            "ol",
            function()
                -- barbar.nvim
                vim.cmd("BufferOrderByLanguage")
            end,
            { desc = "by language" },
        },
        { "<Esc>", nil, { exit = true } },
    },
})

local function choose_buffer()
    if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
        buffer_hydra:activate()
    end
end

vim.keymap.set("n", "gb", choose_buffer)

local window_hint = [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

Hydra({
    name = "Windows",
    hint = window_hint,
    config = {
        invoke_on_body = true,
        hint = {
            offset = -1,
            float_opts = {
                border = "rounded",
            },
        },
    },
    mode = "n",
    body = "<C-w>",
    heads = {
        { "h", "<C-w>h" },
        { "j", "<C-w>j" },
        { "k", pcmd("wincmd k", "E11", "close") },
        { "l", "<C-w>l" },

        { "H", cmd("WinShift left") },
        { "J", cmd("WinShift down") },
        { "K", cmd("WinShift up") },
        { "L", cmd("WinShift right") },

        {
            "<C-h>",
            function()
                splits.resize_left(2)
            end,
        },
        {
            "<C-j>",
            function()
                splits.resize_down(2)
            end,
        },
        {
            "<C-k>",
            function()
                splits.resize_up(2)
            end,
        },
        {
            "<C-l>",
            function()
                splits.resize_right(2)
            end,
        },
        { "=", "<C-w>=", { desc = "equalize" } },

        { "s", pcmd("split", "E36") },
        { "<C-s>", pcmd("split", "E36"), { desc = false } },
        { "v", pcmd("vsplit", "E36") },
        { "<C-v>", pcmd("vsplit", "E36"), { desc = false } },

        { "w", "<C-w>w", { exit = true, desc = false } },
        { "<C-w>", "<C-w>w", { exit = true, desc = false } },

        { "z", cmd("WindowsMaximaze"), { exit = true, desc = "maximize" } },
        { "<C-z>", cmd("WindowsMaximaze"), { exit = true, desc = false } },

        { "o", "<C-w>o", { exit = true, desc = "remain only" } },
        { "<C-o>", "<C-w>o", { exit = true, desc = false } },

        { "b", choose_buffer, { exit = true, desc = "choose buffer" } },

        { "c", pcmd("close", "E444") },
        { "q", pcmd("close", "E444"), { desc = "close window" } },
        { "<C-c>", pcmd("close", "E444"), { desc = false } },
        { "<C-q>", pcmd("close", "E444"), { desc = false } },

        { "<Esc>", nil, { exit = true, desc = false } },
    },
})
