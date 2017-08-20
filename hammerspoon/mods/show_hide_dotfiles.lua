local m = {}

local localMash = mash

if localMash == nil then
    localMash = {"cmd", "alt", "ctrl"}
end

local hotKey

function m.start()
  hotKey = hs.hotkey.bind(localMash, ".", function()
    hidden_status = hs.execute("defaults read com.apple.finder AppleShowAllFiles")
    if hidden_status == "YES\n"  then
      hs.alert('Hiding dotfiles!')
      hs.execute("defaults write com.apple.finder AppleShowAllFiles NO; killall Finder")
    else
      hs.alert('Showing dotfiles!')
      hs.execute("defaults write com.apple.finder AppleShowAllFiles YES; killall Finder")
    end
  end)
end

function m.stop()
  if hotKey then
    hotKey:delete()
  end
end

return m
