---@type LazyKeysSpec[]
local keys = {
    {
        "s",
        mode = { "n", "x", "o" },
        function()
            require("flash").jump()
        end,
        desc = "Flash",
    },
    {
        "S",
        mode = { "n", "x", "o" },
        function()
            require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
    },
    {
        "r",
        mode = "o",
        function()
            require("flash").remote()
        end,
        desc = "Remote Flash",
    },
    {
        "R",
        mode = { "o", "x" },
        function()
            require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
    },
    {
        "<c-s>",
        mode = { "c" },
        function()
            require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
    },
}

---@type Flash.Config
local opts = {
    search = {
        exclude = {
            "notify",
            "cmp_menu",
            "noice",
            "flash_prompt",
            function(win)
                -- exclude non-focusable windows
                return not vim.api.nvim_win_get_config(win).focusable
            end,
        },
    },
    prompt = {
        prefix = { { "⚡", "FlashPromptIcon" } },
    },
}

---@type LazySpec
local spec = {
    "folke/flash.nvim",
    --lazy = false,
    keys = keys,
    event = "VeryLazy",
    --opts = opts,
    config = function()
        local flash = require("flash")
        flash.setup(opts)

        -- NOTE: Flash HopWord
        -- ref: https://github.com/folke/flash.nvim/blob/main/README.md#-examples
        local function format(opts)
            return {
                { opts.match.label1, "FlashMatch" },
                { opts.match.label2, "FlashLabel" },
            }
        end

        vim.keymap.set("n", "<leader>h", function()
            flash.jump({
                search = { mode = "search" },
                label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
                pattern = [[\<]],
                action = function(match, state)
                    state:hide()
                    flash.jump({
                        search = { max_length = 0 },
                        highlight = { matches = false },
                        label = { format = format },
                        matcher = function(win)
                            -- limit matches to the current label
                            return vim.tbl_filter(function(m)
                                return m.label == match.label and m.win == win
                            end, state.results)
                        end,
                        labeler = function(matches)
                            for _, m in ipairs(matches) do
                                -- use the second label
                                m.label = m.label2
                            end
                        end,
                    })
                end,
                labeler = function(matches, state)
                    local labels = state:labels()
                    for m, match in ipairs(matches) do
                        match.label1 = labels[math.floor((m - 1) / #labels) + 1]
                        match.label2 = labels[(m - 1) % #labels + 1]
                        match.label = match.label1
                    end
                end,
            })
        end)
    end,
    --cond = false,
    -- NOTE: easymotion plugin
    enabled = false,
}

return spec
