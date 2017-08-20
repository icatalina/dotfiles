-- caffeine
local m = {}

local caffeine

local imgs = {
  inactive     = 'imgs/inactive@2x.png',
  active       = 'imgs/active@2x.png',
  activeSystem = 'imgs/activesystem@2x.png',

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


function m.start()
  caffeine = hs.menubar.new()

  if caffeine then
    setCaffeineDisplay(nil)
    caffeine:setClickCallback(caffeineClicked)
  end
end

return m
