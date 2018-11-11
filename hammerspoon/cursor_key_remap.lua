local function keyCode(key, modifiers)
  modifiers = modifiers or {}

  return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(100)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function mapVimToArrowKeys(modIn, modOut)
  modOut = modOut == nil and {} or modOut
  hs.hotkey.bind(modIn, 'h', keyCode('left',  modOut), nil, keyCode('left',  modOut))
  hs.hotkey.bind(modIn, 'j', keyCode('down',  modOut), nil, keyCode('down',  modOut))
  hs.hotkey.bind(modIn, 'k', keyCode('up',    modOut), nil, keyCode('up',    modOut))
  hs.hotkey.bind(modIn, 'l', keyCode('right', modOut), nil, keyCode('right', modOut))
end

-- Map Ctrl-[Alt]-Backspace to Delete
hs.hotkey.bind({'ctrl'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))
hs.hotkey.bind({'ctrl', 'alt'}, 'delete', keyCode('forwarddelete', {'alt'}), nil, keyCode('forwarddelete', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'delete', keyCode('forwarddelete', {'alt', 'shift'}), nil, keyCode('forwarddelete', {'alt', 'shift'}))

-- Map Shift-Backspace to Delete
-- hs.hotkey.bind({'shift'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))
-- hs.hotkey.bind({'shift', 'alt'}, 'delete', keyCode('forwarddelete', { 'alt' }), nil, keyCode('forwarddelete'))

-- Map Ctrl-H/J/K/L to Arrow keys
mapVimToArrowKeys({'ctrl'})
-- Map Ctrl-Shift-H/J/K/L to Shift-Arrow keys
mapVimToArrowKeys({'ctrl', 'shift'}, {'shift'})
-- Map Ctrl-Cmd-H/J/K/L to Cmd-Arrow keys
mapVimToArrowKeys({'ctrl', 'cmd'}, {'cmd'})
-- Map Ctrl-Alt-H/J/K/L to Alt-Arrow keys
mapVimToArrowKeys({'ctrl', 'alt'}, {'alt'})
-- Map Ctrl-Shift-Cmd-H/J/K/L to Shift-Cmd-Arrow keys
mapVimToArrowKeys({'ctrl', 'shift', 'cmd'})
-- Map Ctrl-Shift-Alt-H/J/K/L to Shift-Alt-Arrow keys
mapVimToArrowKeys({'ctrl', 'shift', 'alt'}, {'shift', 'alt'})
-- Map Ctrl-Cmd-Alt-H/J/K/L to Ctrl-Shift-Cmd-Arrow keys
mapVimToArrowKeys({'ctrl', 'cmd', 'alt'}, {'cmd', 'ctrl', 'alt'})
mapVimToArrowKeys({'ctrl', 'cmd', 'alt', 'shift'}, {'cmd', 'ctrl', 'alt', 'shift'})



-- KBParadise V60 Keyboard - Allow ~ with <shift-esc>
hs.hotkey.bind({'shift'}, 'escape', keyCode('`', {'shift'}), nil, keyCode('`', {'shift'}))
hs.hotkey.bind({'cmd'},   'escape', keyCode('`', {'cmd'}), nil, keyCode('`', {'cmd'}))

hs.hotkey.bind({'ctrl'}, '\'', keyCode('`'), nil, keyCode('`'))
hs.hotkey.bind({'ctrl', 'alt'}, '\'', keyCode('`', { 'alt' }), nil, keyCode('`', { 'alt' }))
