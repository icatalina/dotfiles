local localMash = mash
local gridSize = 6

if localMash == nil then
    localMash = {"cmd", "alt", "ctrl"}
end

hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.grid.setMargins(hs.geometry.size(0, 0))
hs.grid.setGrid('6x6')

function move(rect)

  local win    = hs.window.focusedWindow()
  local f      = win:frame()
  local screen = win:screen()
  local max    = screen:fullFrame()

  f.x = max.x + (max.w * rect.x)
  f.y = max.y + (max.h * rect.y)
  f.w = max.w * rect.w
  f.h = max.h * rect.h
  win:setFrame(f)
end

local dir = {
  up = 'up',
  down = 'down',
  left = 'left',
  right = 'right',
}

local pos = {
  [dir.up]    = hs.geometry.rect( 0,  0,  1, .5),
  [dir.down]  = hs.geometry.rect( 0, .5,  1, .5),
  [dir.left]  = hs.geometry.rect( 0,  0, .5,  1),
  [dir.right] = hs.geometry.rect(.5,  0, .5,  1),
}

hs.hotkey.bind(localMash, dir.up,    function() move(pos[dir.up   ]) end)
hs.hotkey.bind(localMash, dir.down,  function() move(pos[dir.down ]) end)
hs.hotkey.bind(localMash, dir.left,  function() move(pos[dir.left ]) end)
hs.hotkey.bind(localMash, dir.right, function() move(pos[dir.right]) end)

hs.hotkey.bind(localMash, "g", function() hs.grid.toggleShow() end)

hs.hotkey.bind(localMash, "p", function() hs.grid.toggleShow() end)

-- Screen fullscreen
hs.hotkey.bind(localMash, "m", function()
    hs.window.focusedWindow():maximize()
end)

-- Screen next screen
hs.hotkey.bind(localMash, "n", function()
  local win = hs.window.focusedWindow()
  win:moveToScreen(win:screen():next(), false, true)
end)

-- Screens, adjust to grid
hs.hotkey.bind(localMash, "=", function()
  for _, win in ipairs(hs.window.allWindows()) do
    hs.grid.snap(win)
  end
end)
