vicious = require("vicious")
APW = require("apw/widget")
brightness = loadrc("brightness", "carb0n/brightness")
local icons = loadrc("icons", "carb0n/icons")

-- Battery Status

baticon = wibox.widget.imagebox()
batwidget = wibox.widget.textbox()

vicious.register(batwidget, vicious.widgets.bat,
function(widget, args)
   if args[2] > 80 then baticon:set_image(beautiful.widget_bat_100)
   elseif (args[2] <= 80 and args[2] > 60) then
      baticon:set_image(beautiful.widget_bat_80)
   elseif (args[2] <= 60 and args[2] > 40) then
      baticon:set_image(beautiful.widget_bat_60)
   elseif (args[2] <= 40 and args[2] > 20) then
      baticon:set_image(beautiful.widget_bat_40)
   elseif (args[2] <= 20 and args[2] > 10) then
      baticon:set_image(beautiful.widget_bat_caution)
   else
      baticon:set_image(beautiful.widget_bat_low) end
return string.format("%s %d%%", args[1], args[2]) end, 43, "BAT0")

wifiicon = wibox.widget.imagebox()
wifiicon:set_image(beautiful.widget_wifi)

wifiwidget = wibox.widget.textbox()
vicious.register(wifiwidget, vicious.widgets.wifi, ' ${ssid} [${linp}%]', 7, "wlp2s0")

spacerwidget = wibox.widget.imagebox()
spacerwidget:set_image(beautiful.widget_spacer)
