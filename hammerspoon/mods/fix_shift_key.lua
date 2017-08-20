local m = {}

local modifiers = {
  l_shift = 131330,
  r_shift = 131332,
}

local keys = {}

keys[modifiers.r_shift] = { 4, 16, 22, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47 }
keys[modifiers.l_shift] = { 0, 1, 2, 3, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 23, 50 }

for key, val in pairs(keys) do
  keys[key] = {}
  for k, v in pairs(val) do
    keys[key][v] = true
  end
end

local keyDownHandler = function(evt)
  local keyCode = evt:getKeyCode()
  local eventData = evt:getRawEventData().NSEventData

  local flag = eventData.modifierFlags;
  local character = eventData.characters;

  if (keys[flag]) then
    if (keys[flag][keyCode]) then
      hs.alert(character .. ' should be used with the other shift key', 1)
      return true
    end
  end
end

m.watcher = hs.eventtap.new({
  hs.eventtap.event.types.keyDown,
}, keyDownHandler)

function m.start()
  m.watcher:start()
end

function m.stop()
  m.watcher:stop()
end

return m
