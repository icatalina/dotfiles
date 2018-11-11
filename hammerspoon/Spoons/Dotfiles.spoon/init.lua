local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Dotfiles toggle"
obj.version = "1.0"
obj.author = "Ignacio Catalina <icatalina@gmail.com>"

function obj:toggle()
  local hidden_status = hs.execute("defaults read com.apple.finder AppleShowAllFiles")
  if hidden_status == "YES\n"  then
    hs.alert('Hiding dotfiles!')
    hs.execute("defaults write com.apple.finder AppleShowAllFiles NO; killall Finder")
  else
    hs.alert('Showing dotfiles!')
    hs.execute("defaults write com.apple.finder AppleShowAllFiles YES; killall Finder")
  end
end

function obj:bindHotkeys(mappings)
  hs.spoons.bindHotkeysToSpec(self, mappings)
end

return obj
