local wibox = require("wibox")
local awful = require("awful")
local vicious = require("vicious")

local wibar = {}

function wibar.setup(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])

    for i = 4, 6 do
        awful.tag.gettags(s)[i].layout = awful.layout.suit.floating
    end

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Battery widget
    local battery_widget = wibox.widget.textbox()

    vicious.register(battery_widget, vicious.widgets.bat, function(_, args)
        local charge_percentage = args[2]

        local color = "#8fa598"

        if charge_percentage <= 25 then
            color = "#fb4934"
        elseif charge_percentage <= 59 then
            color = "#fabd2f"
        end

        return "<span color='" .. color .. "'> ".."</span>"
    end, 61, "BAT0")

    -- Padding widget
    local padding_widget = wibox.widget {
        widget = wibox.widget.separator,
        forced_width = 5,
        opacity = 0,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
        },
            mytextclock,
        {
            layout = wibox.layout.fixed.horizontal,
            battery_widget,
            padding_widget,
            wibox.widget.systray(),
        },
    }
end

return wibar