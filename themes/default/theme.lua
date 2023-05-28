---------------------------
-- Default awesome theme --
---------------------------

local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local naughty = require("naughty")

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "JetBrainsMono Nerd Font 12"
theme.tasklist_disable_icon = true

theme.bg_normal     = "#282828"
theme.bg_focus      = "#282828"
theme.bg_urgent     = "#fb4934"
theme.bg_minimize   = "#689d6a"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ebdbb2"
theme.fg_focus      = "#ebdbb2"
theme.fg_urgent     = "#ebdbb2"
theme.fg_minimize   = "#ebdbb2"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
theme.border_normal = "#282828"
theme.border_focus  = "#282828"
theme.border_marked = "#fb4934"

theme.accent = "#689d6a"

-- Generate taglist squares:
local taglist_square_size = dpi(5)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_bg_focus = theme.bg_normal
theme.taglist_fg_focus = theme.accent

theme.taglist_bg_urget = theme.bg_normal
theme.taglist_fg_urget = theme.fg_urgent

-- Variables set for theming notifications:
theme.notification_font = theme.font
theme.notification_bg = theme.bg_normal
naughty.config.defaults.position = "top_middle"
naughty.config.defaults.ontop = true
naughty.config.defaults.timeout = 5

naughty.config.presets.normal = {
  fg = theme.fg_normal,
  bg = theme.bg_normal,
}

naughty.config.presets.low = {
  fg = theme.fg_normal,
  bg = theme.bg_normal,
}

naughty.config.presets.critical = {
  fg = theme.fg_normal,
  bg = theme.bg_urgent
}

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.fg_normal)
theme.titlebar_close_button_focus  = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.bg_urgent)

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.fg_normal)
theme.titlebar_maximized_button_focus_inactive  = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.accent)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.fg_normal)
theme.titlebar_maximized_button_focus_active  = gears.color.recolor_image("/home/empyrean/.config/awesome/themes/default/titlebar/circle.svg", theme.accent)

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
