-- module: wifi - notify on wifi changes
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "WifiSecurity Notifier"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

local CONFIGURATION = {
  whiteList = {},
  secureProtocols = {
    'WPA Personal Mixed',
    'WPA Enterprise Mixed',
    'WPA2 Personal',
    'WPA2 Enterprise',
  },
}
local wifiMenu
local wifiWatcher

function isWhiteListed(name)
  return hs.fnutils.contains(CONFIGURATION.whiteList, name)
end

function isSecure(security)
  return hs.fnutils.contains(CONFIGURATION.secureProtocols, security)
end

function ssidChanged()
  local name = hs.wifi.currentNetwork()
  local security = hs.wifi.interfaceDetails().security

  if not name or isSecure(security) and isWhiteListed(name) then
    if wifiMenu then
      wifiMenu:removeFromMenuBar()
    end
  else
    if not wifiMenu then
      wifiMenu = hs.menubar.newWithPriority(2147483645)
    end

    wifiMenu:setTitle(name)
    wifiMenu:setTooltip('This WiFi network is not recognized. Consider using a known one.')

    if not isSecure(security) then
      wifiMenu:setTitle('Insecure: ' .. name)
      wifiMenu:setTooltip('This WiFi network is insecure. Consider using a secure one.')
    end

  end
end

function obj:config(configuration)
  if configuration.whiteList ~= nil then
    CONFIGURATION.whiteList = configuration.whiteList
  end

  if configuration.secureProtocols ~= nil then
    CONFIGURATION.secureProtocols = configuration.secureProtocols
  end

  return self
end

function obj:start()
  wifiWatcher = hs.wifi.watcher.new(ssidChanged):watchingFor({
    'SSIDChange',
  }):start()

  ssidChanged()
end

function obj:stop()
  if wifiWatcher then
    wifiWatcher:stop()
    wifiWatcher = nil
  end

  if wifiMenu then
    wifiMenu:removeFromMenuBar()
  end
end

return obj
