-- module: send clicked links to the most recently used browser
-- Note: this requires setting the default web browser to Hammerspoon
-- in OS X System Preferences -> General.

local m = {}

local browsers = {
  chrome       = 'com.google.Chrome',
  chromium     = 'org.chromium.Chromium',
  chromeCanary = 'com.google.Chrome.canary',
  firefox      = 'org.mozilla.firefox',
  firefoxDev   = 'org.mozilla.firefoxdeveloperedition',
  safari       = 'com.apple.Safari',
  opera        = 'com.operasoftware.Opera',
}

local browserMap = {{
  regex = '.*.bcapp.dev$',
  id    = browsers.chrome
}, {
  regex = '.*.bcapp.dev/',
  id    = browsers.chrome
}, {
  regex = 'http[s]?://localhost.*',
  id    = browsers.chrome
}, {
  regex = 'http[s]?://127%.0%.0%.1.*',
  id    = browsers.chrome
}, {
  regex = '.*',
  id    = browsers.opera
}}

function getApp(id)
  local appList = hs.application.applicationsForBundleID(id)
  return appList[0] or appList[1]
end

-- callback, called when a url is clicked. Sends the url to the currentHandler.
local function httpCallback(scheme, host, _, fullURL)

  local browser = hs.fnutils.find(browserMap, function(v)
    return string.match(fullURL, v.regex)
  end)

  if not fullURL then
    hs.printf('Attempt to open browser without url')
    return
  end
  hs.urlevent.openURLWithBundle(fullURL, browser.id)
end

function m.start()
  -- set Hammerspoon as the default system URL handler for http and https
  -- (both are set even if only one is specified)
  hs.urlevent.setDefaultHandler('http')
  hs.urlevent.httpCallback = httpCallback
end

function m.stop()
  hs.urlevent.httpCallback = nil
end

function m.printIds()
  for a, b in ipairs(hs.window.visibleWindows()) do hs.printf(b:application():bundleID()) end
end

return m

-- http://s1496033823.bcapp.dev/sfasd
-- http://localhost:8080
-- http://google.com
