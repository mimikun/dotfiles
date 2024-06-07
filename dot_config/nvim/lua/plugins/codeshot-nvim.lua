---@type table
local opts = {
    -- This may be required in case you have not added the binary to the $PATH
    bin_path = "sss_code",
    -- %c = is a sss_code command generated
    -- Example to copy on wayland: "%c | wl-copy"
    -- Format of custom command to run and copy output raw
    copy = "%c",
    -- Run command as Silent
    silent = true,
    window_controls = false,
    -- Enable Shadow
    shadow = false,
    -- Generate shadow from code theme
    shadow_image = false,
    -- Enable line numbers
    show_line_numbers = true,
    -- Allows you to generate a screenshot taking the current neovim theme you have
    use_current_theme = true,
    -- Theme file to use. May be a path, or an embedded theme
    theme = "",
    -- Additional folder to search for .sublime-syntax files in
    extra_syntaxes = "",
    tab_width = vim.opt.shiftwidth,
    -- Lists of fonts to use
    --fonts = vim.opt.guifont:replace(":h", "="):replace(":", "="),
    -- Background of image
    background = "#323232",
    -- Rounded radius of code
    radius = 15,
    -- Leave your mark, add your name to the picture
    author = "",
    author_color = "#FFFFFF",
    -- The title that the code will have at the top next to the window controls
    window_title = "",
    -- The color for the window controls bar, if you leave it empty it will take the background of the theme
    window_title_background = "",
    window_title_color = "#FFFFFF",
    -- The maximum width for window controls
    window_controls_width = 120,
    -- The maximum Height for window controls
    window_controls_height = 40,
    -- Text separation with window controls
    titlebar_padding = 10,
    -- The x padding of the code with the image border
    padding_x = 80,
    -- The y padding of the code with the image border
    padding_y = 100,
    -- Color for the shadow
    shadow_color = "#707070",
    -- The level of blurring to be applied to the shadow
    shadow_blur = 50,
    -- The format in which the image will be saved [default: png]
    save_format = "png",
    -- Auto generate file name based on time (absolute or relative to cwd)
    output = "CodeShot_${year}-${month}-${date}_${time}.png",
}

---@type LazySpec
local spec = {
    "SergioRibera/codeshot.nvim",
    --lazy = false,
    config = function()
        local codeshot = require("codeshot")
        codeshot.setup(opts)
    end,
    --cond = false,
}

return spec
