local wibox = require("wibox")
local awful = require("awful")
local vicious = require("vicious")

local wibar = {}

function wibar.setup(s)

    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    for i = 6, 9 do
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

        local color = "#b8bb26"  -- Default color (green)

        if charge_percentage <= 25 then
            color = "#fb4934"
        elseif charge_percentage <= 59 then
            color = "#fabd2f"
        end

        return "<span color='" .. color .. "'>Battery: " .. charge_percentage .. "%</span>"
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
        },
    }
end

return wibar
