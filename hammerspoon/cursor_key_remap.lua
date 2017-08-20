local function keyCode(key, modifiers)
  modifiers = modifiers or {}

  return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(100)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

-- Map Ctrl-[Alt]-Backspace to Delete
hs.hotkey.bind({'ctrl'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))
hs.hotkey.bind({'ctrl', 'alt'}, 'delete', keyCode('forwarddelete', {'alt'}), nil, keyCode('forwarddelete', {'alt'}))

-- Map Shift-Backspace to Delete
hs.hotkey.bind({'shift'}, 'delete', keyCode('forwarddelete'), nil, keyCode('forwarddelete'))
hs.hotkey.bind({'shift', 'alt'}, 'delete', keyCode('forwarddelete', { 'alt' }), nil, keyCode('forwarddelete'))

-- Map Ctrl-H/J/K/L to Arrow keys
hs.hotkey.bind({'ctrl'}, 'h', keyCode('left'), nil, keyCode('left'))
hs.hotkey.bind({'ctrl'}, 'j', keyCode('down'), nil, keyCode('down'))
hs.hotkey.bind({'ctrl'}, 'k', keyCode('up'), nil, keyCode('up'))
hs.hotkey.bind({'ctrl'}, 'l', keyCode('right'), nil, keyCode('right'))

-- Map Ctrl-Shift-H/J/K/L to Shift-Arrow keys
hs.hotkey.bind({'ctrl', 'shift'}, 'h', keyCode('left', {'shift'}), nil, keyCode('left', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'j', keyCode('down', {'shift'}), nil, keyCode('down', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'k', keyCode('up', {'shift'}), nil, keyCode('up', {'shift'}))
hs.hotkey.bind({'ctrl', 'shift'}, 'l', keyCode('right', {'shift'}), nil, keyCode('right', {'shift'}))

-- Map Ctrl-Cmd-H/J/K/L to Cmd-Arrow keys
hs.hotkey.bind({'ctrl', 'cmd'}, 'h', keyCode('left', {'cmd'}), nil, keyCode('left', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'j', keyCode('down', {'cmd'}), nil, keyCode('down', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'k', keyCode('up', {'cmd'}), nil, keyCode('up', {'cmd'}))
hs.hotkey.bind({'ctrl', 'cmd'}, 'l', keyCode('right', {'cmd'}), nil, keyCode('right', {'cmd'}))

-- Map Ctrl-Alt-H/J/K/L to Alt-Arrow keys
hs.hotkey.bind({'ctrl', 'alt'}, 'h', keyCode('left', {'alt'}), nil, keyCode('left', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'j', keyCode('down', {'alt'}), nil, keyCode('down', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'k', keyCode('up', {'alt'}), nil, keyCode('up', {'alt'}))
hs.hotkey.bind({'ctrl', 'alt'}, 'l', keyCode('right', {'alt'}), nil, keyCode('right', {'alt'}))

-- Map Ctrl-Shift-Cmd-H/J/K/L to Shift-Cmd-Arrow keys
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'h', keyCode('left', {'shift', 'cmd'}), nil, keyCode('left', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'j', keyCode('down', {'shift', 'cmd'}), nil, keyCode('down', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'k', keyCode('up', {'shift', 'cmd'}), nil, keyCode('up', {'shift', 'cmd'}))
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'l', keyCode('right', {'shift', 'cmd'}), nil, keyCode('right', {'shift', 'cmd'}))

-- Map Ctrl-Shift-Alt-H/J/K/L to Shift-Alt-Arrow keys
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'h', keyCode('left', {'shift', 'alt'}), nil, keyCode('left', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'j', keyCode('down', {'shift', 'alt'}), nil, keyCode('down', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'k', keyCode('up', {'shift', 'alt'}), nil, keyCode('up', {'shift', 'alt'}))
hs.hotkey.bind({'ctrl', 'shift', 'alt'}, 'l', keyCode('right', {'shift', 'alt'}), nil, keyCode('right', {'shift', 'alt'}))

-- Map Ctrl-Cmd-Alt-H/J/K/L to Ctrl-Shift-Cmd-Arrow keys
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'h', keyCode('left', {'cmd', 'ctrl', 'alt'}), nil, keyCode('left', {'cmd', 'ctrl', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'j', keyCode('down', {'cmd', 'ctrl', 'alt'}), nil, keyCode('down', {'cmd', 'ctrl', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'k', keyCode('up', {'cmd', 'ctrl', 'alt'}), nil, keyCode('up', {'cmd', 'ctrl', 'alt'}))
hs.hotkey.bind({'ctrl', 'cmd', 'alt'}, 'l', keyCode('right', {'cmd', 'ctrl', 'alt'}), nil, keyCode('right', {'cmd', 'ctrl', 'alt'}))

-- KBParadise V60 Keyboard - Allow ~ with <shift-esc>
hs.hotkey.bind({'shift'}, 'escape', keyCode('`', {'shift'}), nil, keyCode('`', {'shift'}))

hs.hotkey.bind({'ctrl'}, '\'', keyCode('`'), nil, keyCode('`'))
hs.hotkey.bind({'ctrl', 'alt'}, '\'', keyCode('`', { 'alt' }), nil, keyCode('`', { 'alt' }))
