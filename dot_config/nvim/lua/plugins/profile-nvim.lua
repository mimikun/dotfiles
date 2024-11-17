-- TODO: its

local global = require("config.global")

---@type boolean
local cond = global.is_home

---@type string
local avatar_path = table.concat({ global.home, ".icons", "avatar.png" }, global.path_sep)

---@type string
local github_username = "mimikun"

---@type table[]
local profile_cards = {
    {
        title = "mimikun/dotfiles",
        description = "mimikun's dotfiles",
    },
    {
        title = "mimikun/human-rights.nvim",
        description = "A neovim plugin to check and display whether your machine have human rights.",
    },
}

local win_width = vim.o.columns

---@type LazySpec[]
local dependencies = {
    "3rd/image.nvim",
}

---@type LazySpec
local spec = {
    "Kurama622/profile.nvim",
    --lazy = false,
    cmd = "Profile",
    dependencies = dependencies,
    config = function()
        local comp = require("profile.components")

        require("profile").setup({
            avatar_path = avatar_path,
            avatar_opts = {
                avatar_width = 20,
                avatar_height = 20,
                avatar_x = math.floor((win_width - 20) / 2),
                avatar_y = 7,
            },
            user = github_username,
            git_contributions = {
                start_week = 1,
                end_week = 53,
                empty_char = "□",
                full_char = { "■", "■", "■", "■", "■" },
                fake_contributions = nil,
            },
            obj = {
                avatar = nil,
            },
            hide = {
                statusline = true,
                tabline = true,
            },
            bufnr = nil,
            winid = nil,
            format = function()
                comp:avatar()
                comp:text_component_render({
                    comp:text_component("Vanitas vanitatum. et omnia vanitas.", "center", "ProfileRed"),
                    comp:text_component(
                        "たとえ全てが虚しいことだとしても、それは今日最善を尽くさない理由にはならない",
                        "center",
                        "ProfileBlue"
                    ),
                })
                comp:separator_render()
                comp:card_component_render({
                    type = "table",
                    content = function()
                        return profile_cards
                    end,
                    hl = {
                        border = "ProfileYellow",
                        text = "ProfileYellow",
                    },
                })
                comp:separator_render()
                comp:git_contributions_render()
            end,
        })
    end,
    cond = cond,
    enabled = cond,
}

return spec
