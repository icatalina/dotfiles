local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Hammerspoon Handler"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

function obj:toggle()
    hs.menuIcon(not hs.menuIcon()) 
end

function obj:hide() 
    hs.menuIcon(false)
end

function obj:show()
    hs.menuIcon(true)
end

function obj:reload()
    hs.notify.new({
        title = 'Hammerspoon',
        subTitle = 'Config Reloaded!',
        autoWithdraw = true,
        hasActionButton = false,
    }):send()

    hs.reload()
end

function obj:bindHotkeys(mappings)
    hs.spoons.bindHotkeysToSpec(self, mappings)

    return self
end

return obj