-- TODO: config

---@type table
local cmds = {
    "W3m",
    "W3mTab",
    "W3mSplit",
    "W3mVSplit",
    "W3mClose",
    "W3mCopyUrl",
    "W3mReload",
    "W3mAddressBar",
    "W3mShowExternalBrowser",
    "W3mSyntaxOn",
    "W3mSyntaxOff",
    "W3mSetUserAgent",
    "W3mHistory",
    "W3mHistoryClear",
}

---@type LazyKeysSpec[]
local keys = {
    --[[
    * &lt;CR&gt;      Open link under the cursor.
    * &lt;S-CR&gt;    Open link under the cursor (with new tab).
    * &lt;TAB&gt;     Move cursor next link.
    * &lt;s-TAB&gt;   Move cursor previous link.
    * &lt;Space&gt;   Scroll down.
    * &lt;S-Space&gt; Scroll up.
    * &lt;BS&gt;      Back page.
    * &lt;A-LEFT&gt;  Back page.
    * &lt;A-RIGHT&gt; Forward page.
    * =         Show href under the cursor.
    * f         Hit-A-Hint.
    * s         Toggle Syntax On/Off.
    * c         Toggle Cookie On/Off.
    * &lt;M-D&gt;     Edit current url.
    ]]
}

---@type LazySpec
local spec = {
    "yuratomo/w3m.vim",
    lazy = false,
    cmd = cmds,
    --keys = keys,
    --event = "VeryLazy",
    init = function()
        -- Use Proxy
        --let &HTTP_PROXY='http://xxx.xxx/:8080'
        -- Set External Browser:
        --vim.g["w3m#external_browser"] = "chrome"
        -- Set Home Page:
        vim.g["w3m#homepage"] = "http://www.google.co.jp/"
        -- Specify Key Of Hit-A-Hint:
        --vim.g["w3m#hit_a_hint_key"] = "f"
        -- Specify Default Search Engine:
        --vim.g["w3m#search_engine"] = "http://search.yahoo.co.jp/search?search.x=1&fr=top_ga1_sa_124&tid=top_ga1_sa_124&ei=&encoding&aq=&oq=&p="
        -- Disable Default Keymap:
        -- You set as follows if you do not want to use default keymap.
        --vim.g["w3m#disable_default_keymap"] = 1
        -- Disable Vimproc:
        -- You set as follows if you do not want to use vimproc.
        --vim.g["w3m#disable_vimproc"] = 1
        -- Toggle Link Hovering
        -- By default links under the curosr are highlighted. Turn off with one of the following
        --vim.cmd([[unlet g:w3m#set_hover_on]])
        --vim.g["w3m:hover_set_on"] = -1
        -- a value less than or equal to 0 will turn it off
        -- set delay time until highlighting
        --vim.g["w3m#hover_delay_time"] = 100
        -- Search Engine Localization:
        -- Search engines are loaded from `autoload/w3m/search_engines/YOUR_LOCALE/`, and then from the "global" locale
        -- unless a localized search engine of the same name exists. Your locale defaults to `v:lang`, which vim sets
        -- based on your `$LANG` environment variable.
        -- To specify a custom locale for loading search engines:
        --vim.g["w3m#lang"] = "en_US"
        -- Specify path to history file:
        --vim.g["w3m#history#save_file"] = "$HOME/.vim_w3m_hist"
    end,
    config = function()
        -- NOTE: w3m.vim is unlicensed so i can't fork it and improve it
        vim.api.nvim_create_user_command("W3mShowExternalBrowser", ":W3mShowExtenalBrowser", {})
    end,
    --cond = false,
    --enabled = false,
}

return spec
