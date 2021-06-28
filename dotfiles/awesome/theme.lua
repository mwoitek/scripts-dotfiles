local theme_assets             = require("beautiful.theme_assets")
local xresources               = require("beautiful.xresources")
local dpi                      = xresources.apply_dpi
local gfs                      = require("gears.filesystem")
local themes_path              = gfs.get_themes_dir()
local theme                    = {}

-- You can add as many variables as you wish and access them by using
-- beautiful.variable in your rc.lua

local font_name                = "BlexMono Nerd Font Mono"
local font_size                = 11
theme.font                     = font_name .. " " .. tostring(font_size)
theme.useless_gap              = dpi(0)
theme.wallpaper                = "~/wallpapers/thumb-1920-316370.jpg"

theme.bg_focus                 = "#242424"
theme.bg_minimize              = "#404040"
theme.bg_normal                = "#000000"
theme.bg_systray               = theme.bg_normal
theme.bg_urgent                = "#8b0000"

theme.fg_focus                 = "#ffffff"
theme.fg_minimize              = "#ffffff"
theme.fg_normal                = "#ffffff"
theme.fg_urgent                = "#000000"

theme.border_focus             = "#8b0000"
theme.border_marked            = "#ffffff"
theme.border_normal            = "#404040"
theme.border_width             = dpi(2)

theme.hotkeys_description_font = font_name .. " "      .. tostring(font_size - 2)
theme.hotkeys_font             = font_name .. " Bold " .. tostring(font_size - 2)
theme.hotkeys_label_fg         = "#000000"
theme.hotkeys_modifiers_fg     = "#404040"

-- Taglist squares
local taglist_square_size      = dpi(0)
theme.taglist_squares_sel      = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel    = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Layout icons
theme.layout_floating          = themes_path .. "default/layouts/floatingw.png"
theme.layout_fullscreen        = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_max               = themes_path .. "default/layouts/maxw.png"
theme.layout_tile              = themes_path .. "default/layouts/tilew.png"
theme.layout_tilebottom        = themes_path .. "default/layouts/tilebottomw.png"

-- Define the icon theme for application icons. If not set then the icons from
-- /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme               = nil

return theme
