local ext = {
    -- How to format the symbols
    format_symbol = function(symbol_path, filetype)
        if filetype == "json" or filetype == "yaml" then
            return table.concat(symbol_path, ".")
        else
            return symbol_path[#symbol_path]
        end
    end,
    -- Available modes: symbols, lines, both
    show_columns = "both",
}

return ext
