local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Modal"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

local keys = hs.keycodes.map
local event = hs.eventtap.event
local eventtap = hs.eventtap

function keyDown(mods, key)
  hs.fnutils.map(mods, function(m)
    event.newKeyEvent(hs.keycodes.map[m], true):post()
  end)

  event.newKeyEvent(key, true):post()
end

function keyUp(mods, key)
  event.newKeyEvent(key, false):post()

  hs.fnutils.map(mods, function(m)
    event.newKeyEvent(hs.keycodes.map[m], false):post()
  end)
end

function keyRepeat(mods, key)
  hs.fnutils.map(mods, function(m)
    event.newKeyEvent(hs.keycodes.map[m], true):setProperty(event.properties.keyboardEventAutorepeat, 1):post()
  end)

  event.newKeyEvent(key, true):setProperty(event.properties.keyboardEventAutorepeat, 1):post()
end

function mapKey(modal ,modIn, keyIn, modOut, keyOut)
  modal:bind(modIn, keyIn,
    nil,
    function() keyDown(modOut, keyOut) end,
    function() keyUp(modOut, keyOut) end,
    function() keyRepeat(modOut, keyOut) end
  )

  return modal
end

function toMs(ns)
    return ns * 1000000
end

function create(mods, key, thredshold, enable, disable)
    local t = hs.timer
    local time

    watcher = eventtap.new({ event.types.keyDown }, function(event)
        if event:getProperty(hs.eventtap.event.properties.keyboardEventAutorepeat) ~= 1 then
        time = 0
        end
    end)

    keyBind = hs.hotkey.bind(
        mods,
        key,
        function()
            time = t.absoluteTime()
            watcher:start()
            enable()
        end,
        function()
            disable()
            watcher:stop()

            if t.absoluteTime() - time < toMs(thredshold) then
                keyBind:disable()
                eventtap.keyStroke(mods, key, 0)
                keyBind:enable()
            end
        end
    )
end

function obj:new(mods, key, thredshold, enable, disable)
    local modal = hs.hotkey.modal.new()

    function modal:mapKey(modIn, keyIn, modOut, keyOut)
        return mapKey(self, modIn, keyIn, modOut, keyOut)
    end


    create(
        mods,
        key,
        thredshold,
        function()
            enable()
            modal:enter()
        end,
        function()
            disable()
            modal:exit()
        end
    )

    return modal
end

return obj
