-- caffeine
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Caffeine Alternative"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

local caffeine

-- Internal function used to find our location, so we know where to load files from
local function script_path()
  local str = debug.getinfo(2, "S").source:sub(2)
  return str:match("(.*/)")
end
obj.spoonPath = script_path()

local imgs = {
  inactive     = obj.spoonPath .. 'imgs/inactive@2x.png',
  active       = obj.spoonPath .. 'imgs/active@2x.png',
  activeSystem = obj.spoonPath .. 'img/activesystem@2x.png',
}

local function setCaffeineDisplay(state)
  local result = imgs.inactive
  caffeine:setTooltip('Inactive')

  if state == "system" then
    result = imgs.activeSystem
    caffeine:setTooltip('System Idle')
  elseif state == "display" then
    result = imgs.active
    caffeine:setTooltip('Display Idle')
  end

  caffeine:setIcon(result)
end

local function caffeineClicked(t)
  local c = hs.caffeinate
  if c.get("systemIdle") or c.get("displayIdle") then
    c.set("systemIdle", nil, true)
    c.set("displayIdle", nil, true)
    setCaffeineDisplay(nil)
    return
  end
  if t["shift"] then
    if not c.get("systemIdle") then
      c.set("systemIdle", true, true)
      setCaffeineDisplay("system")
    end
  else
    if not c.get("displayIdle") then
      c.set("displayIdle", true, true)
      setCaffeineDisplay("display")
    end
  end
end

function obj:start()
  caffeine = hs.menubar.new()

  if caffeine then
    setCaffeineDisplay(nil)
    caffeine:setClickCallback(caffeineClicked)
  end
end

function obj:stop()
  caffeine:delete()
end

return obj
