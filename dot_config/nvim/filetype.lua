--- ref: https://blog.atusy.net/2023/01/11/neovim-filetype-matching-with-chezmoi/
vim.filetype.add({
    pattern = {
        ["${HOME}/.local/share/chezmoi/.*"] = {
            ---@param path string
            ---@param buf number
            function(path, buf)
                if path:match("/dot_") then
                    return vim.filetype.match({
                        filename = path:gsub("/dot_", "/."),
                        buf = buf,
                    })
                end
            end,
            { priority = -math.huge },
        },
    },
})
