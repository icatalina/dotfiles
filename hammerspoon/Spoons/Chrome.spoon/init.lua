local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Chrome Management"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

function obj:reload()
    hs.osascript.applescript('tell application "Google Chrome" to tell the active tab of its first window to reload')
end

function obj:bindHotkeys(mappings)
    hs.spoons.bindHotkeysToSpec(self, mappings)
end

return obj
