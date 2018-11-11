local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Screen Management"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

local GRID_WIDTH  = 4
local GRID_HEIGHT = 4
local READ_SIZE   = .70

hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.grid.setMargins(hs.geometry.size(0, 0))
hs.grid.setGrid(GRID_WIDTH .. 'x' .. GRID_HEIGHT)

-- Screen fullscreen
function obj:fullScreen()
  local win    = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  win:moveToUnit(hs.geometry.rect(0, 0, 1, 1))

  if oldSize == win:size() and topLeft == win:topLeft() then
    local x = (1 - READ_SIZE) / 2
    win:moveToUnit(hs.geometry.rect(x, 0, READ_SIZE, 1))
  end
end

function obj:moveUp()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowUp(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowShorter(win)
  end
end

function obj:moveDown()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowDown(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowShorter(win)
    hs.grid.pushWindowDown(win)
  end
end

function obj:moveRight()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowRight(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowThinner(win)
    hs.grid.pushWindowRight(win)
  end
end

function obj:moveLeft()
  local win = hs.window.focusedWindow()

  local oldSize = win:size()
  local topLeft = win:topLeft()

  hs.grid.pushWindowLeft(win)

  if oldSize == win:size() and topLeft == win:topLeft() then
    hs.grid.resizeWindowThinner(win)
  end
end

--
function obj:extendUp()
  local win = hs.window.focusedWindow()
  local topLeft = win:topLeft()

  hs.grid.resizeWindowTaller(win)

  if topLeft == win:topLeft() then
    hs.grid.pushWindowUp(win)
  end
end

function obj:extendDown()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowTaller(win)
end

function obj:extendRight()
  local win = hs.window.focusedWindow()
  hs.grid.resizeWindowWider(win)
end

function obj:extendLeft()
  local win = hs.window.focusedWindow()
  local topLeft = win:topLeft()

  hs.grid.resizeWindowWider(win)

  if topLeft == win:topLeft() then
    hs.grid.pushWindowRight(win)
  end
end

function obj:nextScreen()
  local win = hs.window.focusedWindow()
  win:moveToScreen(win:screen():next(), false, true)
end

function obj:showGrid() 
  hs.grid.toggleShow() 
end

function obj:bindHotkeys(mappings)
  hs.spoons.bindHotkeysToSpec(self, mappings)
end

return obj