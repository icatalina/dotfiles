local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Badge.spoon"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

function obj:getBadge(color, alpha)
    local size = hs.screen.mainScreen():currentMode()
    oval = hs.drawing.circle(hs.geometry.rect(size.w - 60, size.h - 60, 20, 20))
    oval:setFillColor({ hex = color, alpha = (alpha or 0.4) }):setStrokeColor({ alpha = 0 })

    return oval
end

return obj
