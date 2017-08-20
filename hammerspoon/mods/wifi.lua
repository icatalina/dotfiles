-- module: wifi - notify on wifi changes
local m = {}

local secureNetworks = {
  'WPA Personal Mixed',
  'WPA Enterprise Mixed',
}

local whiteList = {
  'Marbella+',
  'Infinity',
}

function ssidChanged()
  local wifiName = hs.wifi.currentNetwork()
  local security = hs.wifi.interfaceDetails().security

  if not wifiName or hs.fnutils.contains(secureNetworks, security) and hs.fnutils.contains(whiteList, wifiName) then
    if m.wifiMenu then
      m.wifiMenu:removeFromMenuBar()
    end
  else
    if not m.wifiMenu then
      m.wifiMenu = hs.menubar.newWithPriority(2147483645)
    end

    m.wifiMenu:setTitle(wifiName)
    m.wifiMenu:setTooltip('This WiFi network is not recognized. Consider using a known one.')

    if not hs.fnutils.contains(secureNetworks, security) then
      m.wifiMenu:setTitle('Insecure: ' .. wifiName)
      m.wifiMenu:setTooltip('This WiFi network is insecure. Consider using a secure one.')
    end

  end
end


function m.start()
  m.wifiWatcher = hs.wifi.watcher.new(ssidChanged):watchingFor({
    'SSIDChange',
  }):start()
  ssidChanged()
end

function m.stop()
  if m.wifiWatcher then
    m.wifiWatcher:stop()
    m.wifiWatcher = nil
  end

  if m.wifiMenu then
    m.wifiMenu:removeFromMenuBar()
  end
end

return m
