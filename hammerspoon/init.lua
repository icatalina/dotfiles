local mash = {'cmd', 'alt', 'ctrl'}
local shiftMash = {'cmd', 'alt', 'ctrl', 'shift'}

local keys = hs.keycodes.map

hs.loadSpoon('Hammer'):bindHotkeys({
  toggle = { mash, '-' },
  reload = { mash, 'z' }
}):hide()

hs.loadSpoon('CmdQ'):start()
hs.loadSpoon('Caffeine'):start()

hs.loadSpoon('Dotfiles'):bindHotkeys({
  toggle = { mash, '.' },
})

hs.loadSpoon('WifiSecurity'):config({
  whiteList = {
    'Marbella+',
    'Infinity',
  },
}):start()

hs.loadSpoon('ScreenManagement'):bindHotkeys({
  nextScreen = { mash, keys.n },
  fullScreen = { mash, keys.m },
  showGrid   = { mash, keys.g },

  moveLeft  = { mash, keys.left, },
  moveRight = { mash, keys.right },
  moveDown  = { mash, keys.down },
  moveUp    = { mash, keys.up },

  extendLeft  = { shiftMash, keys.left },
  extendRight = { shiftMash, keys.right },
  extendDown  = { shiftMash, keys.down },
  extendUp    = { shiftMash, keys.up },
})

hs.loadSpoon('Chrome'):bindHotkeys({
  reload = { {'ctrl', 'cmd'}, keys.r },
})

local km = hs.loadSpoon('KeyMapper')

-- KBParadise V60 Keyboard - Allow ~ with <shift-esc>
km:map(keys.escape, { 'shift' }, '`', {'shift'})
km:map(keys.escape, { 'cmd' }, '`', {'cmd'})
km:map('\'', { 'ctrl' }, '`')
km:map('\'', { 'ctrl', 'alt' }, '`', { 'alt' })

km:map(keys.delete, { 'ctrl' }, keys.forwarddelete)
km:map(keys.delete, { 'ctrl', 'alt' }, keys.forwarddelete, { 'alt'})

-- Map Ctrl-H/J/K/L to Arrow keys
km:map(keys.h, {'ctrl'}, keys.left)
km:map(keys.j, {'ctrl'}, keys.down)
km:map(keys.k, {'ctrl'}, keys.up)
km:map(keys.l, {'ctrl'}, keys.right)

-- Map Ctrl-Shift-H/J/K/L to Shift-Arrow keys
km:map(keys.h, {'ctrl', 'shift'}, keys.left,  {'shift'})
km:map(keys.j, {'ctrl', 'shift'}, keys.down,  {'shift'})
km:map(keys.k, {'ctrl', 'shift'}, keys.up,    {'shift'})
km:map(keys.l, {'ctrl', 'shift'}, keys.right, {'shift'})

-- Map Ctrl-Cmd-H/J/K/L to Cmd-Arrow keys
km:map(keys.h, {'ctrl', 'cmd'}, keys.left,  {'cmd'})
km:map(keys.j, {'ctrl', 'cmd'}, keys.down,  {'cmd'})
km:map(keys.k, {'ctrl', 'cmd'}, keys.up,    {'cmd'})
km:map(keys.l, {'ctrl', 'cmd'}, keys.right, {'cmd'})

-- Map Ctrl-Alt-H/J/K/L to Alt-Arrow keys
km:map(keys.h, {'ctrl', 'alt'}, keys.left,  {'alt'})
km:map(keys.j, {'ctrl', 'alt'}, keys.down,  {'alt'})
km:map(keys.k, {'ctrl', 'alt'}, keys.up,    {'alt'})
km:map(keys.l, {'ctrl', 'alt'}, keys.right, {'alt'})

-- Map Ctrl-Shift-Cmd-H/J/K/L to Shift-Cmd-Arrow keys
km:map(keys.h, {'ctrl', 'shift', 'cmd'}, keys.left,  {'shift', 'cmd'})
km:map(keys.j, {'ctrl', 'shift', 'cmd'}, keys.down,  {'shift', 'cmd'})
km:map(keys.k, {'ctrl', 'shift', 'cmd'}, keys.up,    {'shift', 'cmd'})
km:map(keys.l, {'ctrl', 'shift', 'cmd'}, keys.right, {'shift', 'cmd'})

-- Map Ctrl-Shift-Alt-H/J/K/L to Shift-Alt-Arrow keys
km:map(keys.h, {'ctrl', 'shift', 'alt'}, keys.left,  {'shift', 'alt'})
km:map(keys.j, {'ctrl', 'shift', 'alt'}, keys.down,  {'shift', 'alt'})
km:map(keys.k, {'ctrl', 'shift', 'alt'}, keys.up,    {'shift', 'alt'})
km:map(keys.l, {'ctrl', 'shift', 'alt'}, keys.right, {'shift', 'alt'})

-- Map Ctrl-Cmd-Alt-H/J/K/L to Ctrl-Shift-Cmd-Arrow keys
km:map(keys.h, {'ctrl', 'cmd', 'alt'}, keys.left,  {'cmd', 'ctrl', 'alt'})
km:map(keys.j, {'ctrl', 'cmd', 'alt'}, keys.down,  {'cmd', 'ctrl', 'alt'})
km:map(keys.k, {'ctrl', 'cmd', 'alt'}, keys.up,    {'cmd', 'ctrl', 'alt'})
km:map(keys.l, {'ctrl', 'cmd', 'alt'}, keys.right, {'cmd', 'ctrl', 'alt'})

-- Map Ctrl-Cmd-Alt-Shift-H/J/K/L to Ctrl-Cmd-Shift-Alt-Arrow keys
km:map(keys.h, {'ctrl', 'cmd', 'alt', 'shift'}, keys.left,  {'cmd', 'ctrl', 'alt', 'shift'})
km:map(keys.j, {'ctrl', 'cmd', 'alt', 'shift'}, keys.down,  {'cmd', 'ctrl', 'alt', 'shift'})
km:map(keys.k, {'ctrl', 'cmd', 'alt', 'shift'}, keys.up,    {'cmd', 'ctrl', 'alt', 'shift'})
km:map(keys.l, {'ctrl', 'cmd', 'alt', 'shift'}, keys.right, {'cmd', 'ctrl', 'alt', 'shift'})
