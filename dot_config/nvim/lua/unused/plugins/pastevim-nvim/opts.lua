---@type table
local publishing_level = {
    public = 0,
    unlisted = 1,
    priveate = 2,
}

---@type string
local expiry
--expiry = "N" -- Never
expiry = "10M" -- 10 Minutes
--expiry = "1H" -- 1 Hour
--expiry = "1D" -- 1 Day
--expiry = "1W" -- 1 Week
--expiry = "2W" -- 2 Weeks
--expiry = "1M" -- 1 Month
--expiry = "6M" -- 6 Months
--expiry = "1Y" -- 1 Year

---@type table
local opts = {
    api_key = vim.fn.expand("$PASTEBIN_API_KEY"),
    public = publishing_level.unlisted,
    -- Whether to include the filename when uploading to Pastebin
    include_filename = true,
    -- Default expiry of the pastes.
    expiry = expiry,
}

return opts
