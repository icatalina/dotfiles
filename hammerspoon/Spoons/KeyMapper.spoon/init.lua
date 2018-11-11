local obj = {}
obj.__index = obj

local function sendKeyCode(key, modifiers)
  modifiers = modifiers or {}

  return function()
    for key, mod in ipairs(modifiers) do
      hs.eventtap.event.newKeyEvent(mod, true):post()
    end
  
    hs.eventtap.event.newKeyEvent(key, true):post()
    hs.timer.usleep(100)
    hs.eventtap.event.newKeyEvent(key, false):post()

    for key, mod in ipairs(modifiers) do
      hs.eventtap.event.newKeyEvent(mod, false):post()
    end
  end
end

function obj:map(codeIn, modIn, codeOut, modOut)
  if codeIn == nil then
    error('Configuration not valid. At minimum you have to specify a codeIn: ' .. codeIn)
  end

  modIn = modIn == nil and {} or modIn
  modOut = modOut == nil and {} or modOut
  codeOut = codeOut == nil and {} or codeOut
  
  hs.hotkey.bind(
    modIn, 
    codeIn, 
    sendKeyCode(codeOut, modOut), 
    nil, 
    sendKeyCode(codeOut, modOut)
  )

  return self
end

return obj