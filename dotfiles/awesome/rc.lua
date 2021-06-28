-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears         = require("gears")
local awful         = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox         = require("wibox")
-- Theme handling library
local beautiful     = require("beautiful")
-- Notification library
local naughty       = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title  = "There were errors during startup.",
        text   = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal(
        "debug::error",
        function(err)
            -- Make sure we don't go into an endless error loop
            if in_error then return end
            in_error = true
            naughty.notify({
                preset = naughty.config.presets.critical,
                title  = "An error happened.",
                text   = tostring(err)
            })
            in_error = false
        end
    )
end

-- Variable definitions
-- Themes define colors, icons, font and wallpapers
beautiful.init("~/.config/awesome/theme.lua")

-- Defaults
browser  = "librewolf"
modkey   = "Mod4"
terminal = "alacritty"

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile.bottom,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.tile,
    awful.layout.suit.floating
}

layouts    = awful.layout.layouts
tags       = {
    names  = { "term", "web", "3", "vm", "5", "6", "7", "8", "edit" },
    layout = { layouts[1], layouts[2], layouts[1], layouts[2], layouts[1],
               layouts[1], layouts[1], layouts[2], layouts[2] }
}

-- Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g., different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table
    awful.tag(tags.names, s, tags.layout)

    -- Create an imagebox widget which will contain an icon indicating which layout we're using
    -- We need one layoutbox per screen
    s.mylayoutbox = awful.widget.layoutbox(s)

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.noempty
    }

    -- Create a tasklist widget
    s.mytasklist                  = awful.widget.tasklist {
        screen                    = s,
        filter                    = awful.widget.tasklist.filter.currenttags,
        style                     = {
            tasklist_disable_icon = true
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mytextclock
        }
    }
end)

-- Key bindings
globalkeys = gears.table.join(
    -- Awesome
    awful.key({ modkey,           }, "b",
        function() mouse.screen.mywibox.visible = not mouse.screen.mywibox.visible end,
        {description = "toggle bar",           group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q",      awesome.quit,
              {description = "quit awesome",   group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "r",      awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description = "show help",      group = "awesome"}),

    -- Launcher
    awful.key({ modkey,           }, "i",      function() awful.spawn(browser)  end,
              {description = "open browser",   group = "launcher"}),
    awful.key({ modkey,           }, "t",      function() awful.spawn(terminal) end,
              {description = "open terminal",  group = "launcher"}),

    -- dmenu
    -- awful.key({ modkey            }, "d",
    --     function()
    --         local colors_nor = "-nb \'"   .. beautiful.bg_normal .. "\' " ..
    --                            "-nf \'"   .. beautiful.fg_normal .. "\' "
    --         local colors_sel = "-sb \'"   .. beautiful.bg_focus  .. "\' " ..
    --                            "-sf \'"   .. beautiful.fg_focus  .. "\' "
    --         local font       = "-fn \'JetBrainsMono Nerd Font Mono:size=12\'"
    --         local lines      = 25
    --         local options    = " -l "     .. tostring(lines)     .. " "   ..
    --                            colors_nor .. colors_sel          .. font
    --         awful.spawn.with_shell("dmenu_run -c" .. options)
    --     end,
    --     {description = "run dmenu",            group = "launcher"}),

    -- rofi
    awful.key({ modkey,           }, "r",
        function()
            awful.spawn.with_shell("rofi -show combi")
        end,
        {description = "run rofi",             group = "launcher"}),

    awful.key({ modkey,           }, "[",      awful.tag.viewprev,
              {description = "view previous",  group = "tag"}),
    awful.key({ modkey,           }, "]",      awful.tag.viewnext,
              {description = "view next",      group = "tag"}),

--
    awful.key({ modkey,           }, "-", function() awful.screen.focus_relative(-1) end,
              {description = "previous screen", group = "screen"}),
    awful.key({ modkey,           }, "=", function() awful.screen.focus_relative( 1) end,
              {description = "next screen", group = "screen"}),

    awful.key({ modkey,           }, "j",
        function()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index",     group = "client"}),
    awful.key({ modkey,           }, "k",
        function()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Layout manipulation
    awful.key({ modkey,           }, "l",     function() awful.tag.incmwfact( 0.05) end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function() awful.tag.incmwfact(-0.05) end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey,           }, "space", function() awful.layout.inc( 1) end,
              {description = "select next",                  group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function() awful.layout.inc(-1) end,
              {description = "select previous",              group = "layout"})
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey,           }, "c",      function(c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                    ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey,           }, "Return", function(c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function(c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"})
)

-- Bind all key numbers to tags
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only
        awful.key({ modkey }, "#" .. i + 9,
                  function()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                          tag:view_only()
                      end
                  end,
                  {description = "view tag #" .. i, group = "tag"}),
        -- Toggle tag display
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                          awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                      end
                  end,
                  {description = "move focused client to tag #" .. i, group = "tag"}),
        -- Toggle tag on focused client
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Set keys
root.keys(globalkeys)

-- Rules
-- Rules to apply to new clients (through the "manage" signal)
awful.rules.rules = {
    -- All clients will match this rule
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus        = awful.client.focus.filter,
                     raise        = true,
                     keys         = clientkeys,
                     screen       = awful.screen.preferred,
                     placement    = awful.placement.no_overlap+awful.placement.no_offscreen }
    },

    -- Floating clients
    {
        rule_any     = {
            name     = {
                "Event Tester", -- xev
                "MEGAsync",
                "Terminal Preferences",
                "Terminator Preferences"
            }
        },
        properties   = {
            floating = true
        }
    },

    -- Remove titlebars
    {
        rule_any              = {
            type              = {
                "dialog",
                "normal"
            }
        },
        properties            = {
            titlebars_enabled = false
        }
    },

    -- Tag web
    {
        rule_any        = {
            class       = {
                "Brave-browser",
                "Chromium",
                "Firefox",
                "firefox",
                "LibreWolf"
            }
        },
        properties      = {
            tag         = "web",
            switchtotag = true
        }
    },

    -- Tag vm
    {
        rule_any        = {
            class       = {
                "VirtualBox Machine",
                "VirtualBox Manager"
            }
        },
        properties      = {
            tag         = "vm",
            switchtotag = true
        }
    },

    -- Tag 8
    {
        rule_any        = {
            class       = {
                "Thunar"
            }
        },
        properties      = {
            tag         = "8",
            switchtotag = true
        }
    },

    -- Tag edit
    {
        rule_any        = {
            class       = {
                "code-oss",
                "Emacs",
                "RStudio",
                "vscodium",
                "VSCodium"
            }
        },
        properties      = {
            tag         = "edit",
            switchtotag = true
        }
    }
}

-- Signals
-- Signal function to execute when a new client appears
client.connect_signal("manage", function(c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes
        awful.placement.no_offscreen(c)
    end
end)
-- }}}

-- Enable sloppy focus, so that focus follows mouse
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
client.connect_signal("focus",   function(c) c.border_color = beautiful.border_focus  end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Autostart applications
local autostart_apps = {
    "~/.config/keyboard_config/keyboard_config.sh",
    "picom --experimental-backends"
}
for app = 1, #autostart_apps do
    awful.spawn.with_shell(autostart_apps[app])
end
