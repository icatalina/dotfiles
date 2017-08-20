-- Module to show a warning on quit. having to press CMD+Q twice to quit

local m = {}

local quitModal = hs.hotkey.modal.new('cmd', 'q')

function quitModal:entered()
    hs.alert.show("Press Cmd+Q again to quit", 1)
    hs.timer.doAfter(1, function() quitModal:exit() end)
end

local function doQuit()
    local res = hs.application.frontmostApplication():selectMenuItem("^Quit.*$")
    quitModal:exit()
end

m.start = function()
  quitModal:bind('cmd', 'q', doQuit)
  quitModal:bind('', 'escape', function() quitModal:exit() end)
end

return m
