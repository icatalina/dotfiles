local obj = {}
obj.__index = obj

-- Metadata
obj.name = "CMD-Q Protection"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

local quitModal = hs.hotkey.modal.new('cmd', 'q')

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local res = hs.application.frontmostApplication():selectMenuItem("^Quit.*$")
    quitModal:exit()
end

function obj:start()
  quitModal:bind('cmd', 'q', doQuit)
  quitModal:bind('', 'escape', function() quitModal:exit() end)
end

function obj:stop()
    quotModal:delete()
end

return obj
