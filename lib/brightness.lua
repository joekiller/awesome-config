-- Handle brightness (with xbacklight)

local awful        = require("awful")
local naughty      = require("naughty")
local tonumber     = tonumber
local string       = string
local os           = os
local math         = math

-- A bit odd, but...
require("lib/icons")
local icons        = package.loaded["carb0n/icons"]

brightness = {}

local nid = nil
local function report()
   awful.spawn.easy_async({"bash", "-c", "xbacklight -get"}, function(stdout, stderr, reason, exit_code)
       out = tonumber(stdout)
       local icon = icons.lookup({name = "display-brightness",
           type = "status"})

       nid = naughty.notify({ text = string.format("%3d %%", math.floor(out)),
           icon = icon,
           font = "Free Sans Bold 24",
           replaces_id = nid }).id
   end)
end

function brightness.increase()
   awful.util.spawn_with_shell("xbacklight -inc 5")
   report()
end

function brightness.decrease()
   awful.util.spawn_with_shell("xbacklight -dec 5")
   report()
end

return brightness
