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

function obj:moveDown()
  hs.grid.adjustWindow(function(cell)
    cell.y = cell.y + 1
  end)
end

function obj:moveRight()
  hs.grid.adjustWindow(function(cell)
    cell.x = cell.x + 1
  end)
end

function obj:moveUp()
  hs.grid.adjustWindow(function(cell)
    if cell.y == 0 then
      cell.h = cell.h - 1
    else
      cell.y = cell.y - 1
    end
  end)
end

function obj:moveLeft()
  hs.grid.adjustWindow(function(cell)
    if cell.x == 0 then
      cell.w = cell.w - 1
    else
      cell.x = cell.x - 1
    end
  end)
end

function obj:extendUp()
  hs.grid.adjustWindow(function(cell)
    cell.y = cell.y - 1
    cell.h = cell.h + 1
  end)
end

function obj:extendDown()
  hs.grid.adjustWindow(function(cell)
    if cell.h + cell.y == GRID_HEIGHT then
      cell.y = cell.y - 1
    end

    cell.h = cell.h + 1
  end)
end

function obj:extendRight()
  hs.grid.adjustWindow(function(cell)
    if cell.w + cell.x == GRID_WIDTH then
      cell.x = cell.x - 1
    end

    cell.w = cell.w + 1
  end)
end

function obj:extendLeft()
  hs.grid.adjustWindow(function(cell)
    cell.x = cell.x - 1
    cell.w = cell.w + 1
  end)
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