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

module("carb0n/brightness")

local nid = nil
local function report()
   local out = awful.util.pread("xbacklight -get")
   if not out then return end

   out = tonumber(out)
   local icon = icons.lookup({name = "display-brightness",
			      type = "status"})

   nid = naughty.notify({ text = string.format("%3d %%", math.floor(out)),
			  icon = icon,
			  font = "Free Sans Bold 24",
			  replaces_id = nid }).id
end

function increase()
   awful.util.spawn_with_shell("xbacklight -inc 5")
   report()
end

function decrease()
   awful.util.spawn_with_shell("xbacklight -dec 5")
   report()
end
