local wibox = require("wibox")
local awful = require("awful")
local vicious = require("vicious")
local gears = require("gears")

local wibar = {}

function wibar.setup(s)

    -- Each screen has its own tag table.
    awful.tag({ "󰆢 ", "󰆢 ", "󰆢 ", "󱂬 ", "󱂬 ", "󱂬 " }, s, awful.layout.layouts[1])

    for i = 4, 6 do
        awful.tag.gettags(s)[i].layout = awful.layout.suit.floating
    end

    -- Power widget
    local power_widget = wibox.widget {
        {
            text = " ",
            widget = wibox.widget.textbox
        },
        widget = wibox.container.background,
        fg = "#fb4934"
    }

    power_widget:buttons(gears.table.join(
        awful.button({}, 1, function ()
            awful.spawn.with_shell("~/.config/awesome/scripts/powermenu.sh")
        end)
    ))

    -- Search widget
    local search_widget = wibox.widget {
        {
            text = " ",
            widget = wibox.widget.textbox
        },
        widget = wibox.container.background
    }

    search_widget:buttons(gears.table.join(
        awful.button({}, 1, function ()
            awful.spawn.with_shell("~/.config/awesome/scripts/launcher.sh")
        end)
    ))

    -- Taglist widget
    taglist_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Date widget
    local date_widget = wibox.widget {
        widget = wibox.widget.textclock
    }

    -- Battery widget
    local battery_widget = wibox.widget.textbox()

    vicious.register(battery_widget, vicious.widgets.bat, function(_, args)
        local charge_percentage = args[2]

        local color = "#689d6a"

        if charge_percentage <= 25 then
            color = "#fb4934"
        elseif charge_percentage <= 59 then
            color = "#fabd2f"
        end

        return "<span color='" .. color .. "'>  ".."</span>"
    end, 61, "BAT0")

    battery_widget:buttons(gears.table.join(
        awful.button({}, 1, function ()
            awful.spawn.with_shell("~/.config/awesome/scripts/power-save.sh")
        end)
    ))

    -- Padding widget
    local padding_widget = wibox.widget {
        widget = wibox.widget.separator,
        forced_width = 5,
        opacity = 0,
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s,
        width = 1908,
        height = 24,
        border_width = 4,
        border_color = "#00000000"
    })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            padding_widget,
            power_widget,
            padding_widget,
            search_widget,
            padding_widget,
            taglist_widget,
        },
            date_widget,
        {
            layout = wibox.layout.fixed.horizontal,
            battery_widget,
            wibox.widget.systray(),
        },
    }
end

return wibar
