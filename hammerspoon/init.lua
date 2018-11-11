mash = {'cmd', 'alt', 'ctrl'}

-- Reload Hammerspoon Config
hs.hotkey.bind(mash, 'z', function()
  hs.notify.new({
    title = 'Hammerspoon',
    subTitle = 'Config Reloaded!',
    autoWithdraw = true,
    hasActionButton = false,
  }):send()

  hs.reload()
end)

-- Reload Chrome active tab
hs.hotkey.bind({'ctrl', 'cmd'}, 'R', function()
  hs.osascript.applescript('tell application "Google Chrome" to tell the active tab of its first window to reload')
end)

-- Sleep system
hs.hotkey.bind(mash, 'escape', function()
  hs.caffeinate.startScreensaver()
end)

require('cursor_key_remap')
require('screen_management')

local mods = {
--  'event_listener',
  'show_hide_dotfiles',
--  'fix_shift_key',
--  'browser_handler',
  'caffeine',
  'wifi',
  'cmdq',
}

modules = {}

for key, mod in ipairs(mods) do
  modules[mod] = require('mods/' .. mod)
  modules[mod].start()
  hs.printf('Started module ' .. mod)
end

-- Ensure everything is loaded before hiding the icon :)
-- Show/Hide menu icon
hs.hotkey.bind(mash, '-', function()
  hs.menuIcon(not hs.menuIcon())
end)
hs.menuIcon(false)
