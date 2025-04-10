---@module 'blink-cmp-dictionary'
---@type blink-cmp-dictionary.Options
local opts = {
    async = true,
    -- Where is your dictionary files
    dictionary_files = nil,
    -- Where is your dictionary directories, all the .txt files in the directory will be loaded
    dictionary_directories = nil,
    -- The command to get the word list
    kind_icons = {
        Dict = "󰘝",
    },
}

---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local dictionary = {
    module = "blink-cmp-dictionary",
    name = "Dict",
    min_keyword_length = 3,
    opts = opts,
}

return dictionary
