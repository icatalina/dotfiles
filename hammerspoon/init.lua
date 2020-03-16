local mash = {'cmd', 'alt', 'ctrl'}
local shiftMash = {'cmd', 'alt', 'ctrl', 'shift'}

local keys = hs.keycodes.map

function alert(msg)
  return function()
    hs.alert.show(msg, 0.3)
  end
end

hs.loadSpoon('CmdQ'):start()
hs.loadSpoon('Caffeine'):start()
hs.loadSpoon('WifiSecurity')
  :config({
    whiteList = {
      'Marbella+',
      'Infinity',
    },
  })
  :start()


local badge = hs.loadSpoon('Badge'):getBadge('#ff00aa')
local vim = hs.loadSpoon('Vim')

function enable()
  badge:show()
  vim:enable()
end

function disable()
  badge:hide()
  vim:disable()
end


modal = hs.loadSpoon('Modal'):new({ 'fn' }, keys.escape, 300, enable, disable)


local hammer = hs.loadSpoon('Hammer')
local chrome = hs.loadSpoon('Chrome')
local dotfiles = hs.loadSpoon('Dotfiles')
local screen = hs.loadSpoon('ScreenManagement')

modal
  :mapKey({}, keys.delete, {}, keys.forwarddelete)
  :mapKey({ 'alt' }, keys.delete, { 'alt' }, keys.forwarddelete)
  :mapKey({ 'cmd' }, keys.delete, { 'cmd' }, keys.forwarddelete)

  :mapKey({}, keys['return'], { 'ctrl' }, keys['return'])

  :bind({}, keys.tab, alert('That is not a ctrl key'))
  :bind({'shift'}, keys.tab, alert('That is not a ctrl key'))

  :mapKey({}, keys.a, { 'cmd' }, keys.left)
  :mapKey({}, keys.e, { 'cmd' }, keys.right)

  :bind({ 'shift' }, keys.t, function() hs.timer.doAfter(0.2, function() hs.hid.capslock.toggle() end) end)

  :bind({ 'shift' }, keys.r, function() chrome:reload() end)

  :bind({ 'shift' }, keys['\\'], function() hammer:reload() end)
  :bind({}, keys['\\'], function() hammer:toggle() end)

  :bind({}, keys['.'], function() dotfiles:toggle() end)

  :bind({}, keys.m, function() screen:fullScreen() end)
  :bind({}, keys.n, function() screen:nextScreen() end)
  :bind({}, keys.i, function() screen:showGrid() end)

  :bind({}, keys[']'], function() screen:moveRight() end)
  :bind({}, keys['['], function() screen:moveLeft() end)
  :bind({ 'shift '}, keys[']'], function() screen:extendRight() end)
  :bind({ 'shift' }, keys['['], function() screen:extendLeft() end)
