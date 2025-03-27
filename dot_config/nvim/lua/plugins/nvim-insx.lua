---@type LazySpec
local spec = {
    "hrsh7th/nvim-insx",
    --lazy = false,
    event = "InsertEnter",
    init = function()
        vim.b.insx_disabled = false
    end,
    config = function()
        require("insx.preset.standard").setup()

        local insx = require("insx")
        local esc = insx.helper.regex.esc
        local insx_recipe_substitute = require("insx.recipe.substitute")
        local insx_recipe_pair_spacing = require("insx.recipe.pair_spacing")
        local insx_recipe_auto_pair = require("insx.recipe.auto_pair")
        local insx_recipe_snippet = require("insx.recipe.snippet")

        insx_recipe_snippet.expand = function(params)
            vim.snippet.expand(params.content)
        end

        insx.add(
            "'",
            insx.with(
                insx_recipe_auto_pair({
                    open = "'",
                    close = "'",
                }),
                {
                    insx.with.in_string(false),
                    insx.with.in_comment(false),
                    insx.with.nomatch([[\\\%#]]),
                    insx.with.nomatch([[\a\%#]]),
                }
            )
        )
        -- TODO: koko
        insx.add(
            "(",
            insx.with(
                require("insx.preset.auto_pair")({
                    open = "(",
                    close = ")",
                }),
                {
                    insx.with.priority(10),
                    insx.with.filetype({ "html", "markdown" }),
                    insx.with.in_string(false),
                    insx.with.in_comment(false),
                    insx.with.undopoint(),
                }
            )
        )

        insx.add(
            "<Space>",
            insx_recipe_snippet({
                pattern = [[^\s*if\%#$]],
                content = insx.dedent([[
                    if $1 then
                      $0
                    end
                ]]),
            })
        )

        -- auto html tags.
        insx.add(
            ">",
            insx_recipe_substitute({
                pattern = [[<\(\w\+\).\{-}\%#]],
                replace = [[\0>\%#</\1>]],
            })
        )

        -- delete html tags.
        insx.add(
            "<BS>",
            insx_recipe_substitute({
                pattern = [[<\(\w\+\).\{-}>\%#</.\{-}>]],
                replace = [[\%#]],
            })
        )

        insx.add(
            "(",
            insx_recipe_auto_pair({
                open = "(",
                close = ")",
            })
        )

        insx.add(
            "(",
            insx_recipe_auto_pair.strings({
                open = [[']],
                close = [[']],
            })
        ) -- preset for strings.

        insx.add(
            "<BS>",
            insx_recipe_auto_pair({
                open_pat = esc("("),
                close_pat = esc(")"),
            })
        )

        insx.add(
            "<BS>",
            insx_recipe_auto_pair.strings({
                open_pat = esc([[']]),
                close_pat = esc([[']]),
            })
        ) -- preset for strings.

        insx.add(
            ")",
            require("insx.recipe.jump_next")({
                jump_pat = {
                    [[\%#]] .. esc(")") .. [[\zs]],
                },
            })
        )

        insx.add(
            "<CR>",
            require("insx.recipe.fast_break")({
                open_pat = esc("("),
                close_pat = esc(")"),
                arguments = true,
                html_attrs = true,
                html_tags = true,
            })
        )

        insx.add(
            "<C-]>",
            require("insx.recipe.fast_wrap")({
                close = ")",
            })
        )

        insx.add(
            "<Space>",
            insx_recipe_pair_spacing.increase({
                open_pat = esc("("),
                close_pat = esc(")"),
            })
        )

        insx.add(
            "<BS>",
            insx_recipe_pair_spacing.decrease({
                open_pat = esc("("),
                close_pat = esc(")"),
            })
        )
    end,
    cond = false,
    enabled = false,
}

return spec
