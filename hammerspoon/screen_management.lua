local localMash = mash
local gridWidth  = 4
local gridHeight = 4
local readSize   = .70

if localMash == nil then
    localMash = {"cmd", "alt", "ctrl"}
end

hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.grid.setMargins(hs.geometry.size(0, 0))
hs.grid.setGrid(gridWidth .. 'x' .. gridHeight)

function doubleMove(rect, alt)
  local win    = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  win:moveToUnit(rect)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.alert('same')
    win:moveToUnit(alt)
  end
end


function move(rect)
  local win    = hs.window.focusedWindow()

  win:moveToUnit(rect, 0)
end

local dir = {
  up = 'up',
  down = 'down',
  left = 'left',
  right = 'right',
}

hs.hotkey.bind(localMash, "g", function() hs.grid.toggleShow() end)

-- Screen fullscreen
hs.hotkey.bind(localMash, "m", function()
  local win    = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  win:moveToUnit(hs.geometry.rect(0, 0, 1, 1))

  if oldSize == win:size() and topLeft == win:topLeft() then
    local x = (1 - readSize) / 2
    win:moveToUnit(hs.geometry.rect(x, 0, readSize, 1))
  end
end)

function alterGrid(x, y, w, h)
  local win = hs.window.focusedWindow()
  local grid = hs.grid.get(win)

  if grid.x > 0 and x > 0 then
    w = w + x - grid.x
    x = grid.x - x
  end

  local newSize = hs.geometry.rect(
    math.max(0, grid.x + x),
    math.max(0, grid.y + y),
    math.max(1, grid.w - w),
    math.max(1, grid.h - h)
  )

  hs.grid.set(win, newSize)
end

function AlterGrid(x, y, w, h)
  return function()
    alterGrid(x, y, w, h)
  end
end


function up()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowUp(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowShorter(win)
  end
end

function down()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowDown(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowShorter(win)
    hs.grid.pushWindowDown(win)
  end
end

function right()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowRight(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowThinner(win)
    hs.grid.pushWindowRight(win)
  end
end

function left()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowLeft(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowThinner(win)
  end
end

--
function upPlus()
  local win = hs.window.focusedWindow()
  local topLeft = win:topLeft()

  hs.grid.resizeWindowTaller(win)

  if topLeft == win:topLeft() then
    hs.grid.pushWindowUp(win)
  end
end

function downPlus()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowTaller(win)
end

function rightPlus()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowWider(win)
end

function leftPlus()
  local win = hs.window.focusedWindow()
  local topLeft = win:topLeft()

  hs.grid.resizeWindowWider(win)

  if topLeft == win:topLeft() then
    hs.grid.pushWindowRight(win)
  end
end

hs.hotkey.bind(localMash, 'right', right)
hs.hotkey.bind(localMash, 'down',  down)
hs.hotkey.bind(localMash, 'left',  left)
hs.hotkey.bind(localMash, 'up',    up)

local shiftLocalMash = hs.fnutils.concat(hs.fnutils.copy(localMash), {'shift'})

hs.hotkey.bind(shiftLocalMash, 'right', rightPlus)
hs.hotkey.bind(shiftLocalMash, 'down',  downPlus)
hs.hotkey.bind(shiftLocalMash, 'left',  leftPlus)
hs.hotkey.bind(shiftLocalMash, 'up',    upPlus)

-- Screen next screen
hs.hotkey.bind(localMash, "n", function()
  local win = hs.window.focusedWindow()
  win:moveToScreen(win:screen():next(), false, true)
end)
