-- listen key events
local mod = {}

mod.flagsChangeCallbacks = {}
mod.keyDownCallbacks = {}

mod.flagsChangeListener = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(e)
    local result = false
    for i = 1, #mod.flagsChangeCallbacks do
        result = result or mod.flagsChangeCallbacks[i](e)
    end
    return result
end)

mod.keyDownListener = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local result = false
    for i = 1, #mod.keyDownCallbacks do
        result = result or mod.keyDownCallbacks[i](e)
    end
    return result
end)

mod.start = function()
   mod.flagsChangeListener:start()
   mod.keyDownListener:start()
end

mod.stop = function()
   mod.flagsChangeListener:stop()
   mod.keyDownListener:stop()
end

-- double ctrl -> esc
-- local lastCtrlTime = 0
-- table.insert(mod.flagsChangeCallbacks, function(e)
--     local f = e:getFlags()
--     if f.ctrl and not (f.cmd or f.alt or f.fn or f.shift) then
--         local now = hs.timer.secondsSinceEpoch()
--         if now - lastCtrlTime < 0.5 then
--             hs.eventtap.keyStroke({}, 'escape', 10)
--         end
--         lastCtrlTime = now
--     end
-- end)

local escape = 0x35
local noFlags = 256

table.insert(mod.keyDownCallbacks, function(e)
  escText = 'Use a short tap in ctrl for ESC'
  local keyCode = hs.keycodes.map[e:getKeyCode()]
  if keyCode == 'escape' and e:getRawEventData()['CGEventData']['flags'] == noFlags then
    hs.alert.show(escText, 2)
    return true
  end
end)

-- Send ESC if CTRL press for less than 0.2 sec
local send_escape = nil
local threshold = 0.2
local last_mods = {}

local control_key_timer = hs.timer.delayed.new(threshold, function()
    send_escape = false
end)

table.insert(mod.flagsChangeCallbacks, function(evt)
    local new_mods = evt:getFlags()

    if last_mods.ctrl == new_mods.ctrl then
        return false
    end

    if not last_mods.ctrl then
        last_mods = new_mods
        send_escape = true
        control_key_timer:start()
    else
        if send_escape then
            hs.eventtap.keyStroke({}, "escape", 10)
        end
        last_mods = new_mods
        control_key_timer:stop()
    end

    return false
end)

table.insert(mod.keyDownCallbacks, function(evt)
    send_escape = false
    return false
end)

return mod
