local ext = {
    show_scores = true,
    ignore_patterns = { "*.git/*", "*/tmp/*" },
    match_algorithm = require("config.global").is_windows and "fzy" or "fzf",
    disable_devicons = false,
    open_buffer_indicators = { previous = "•", others = "∘" },
}

return ext
