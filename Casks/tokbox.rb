cask "tokbox" do
  version "0.3.0"
  sha256 "300b3e8c622f09008aa8c79ec8ea6f5518b8b87b007d111cd89c251349e4e710"

  url "https://yx-web-nosdn.netease.im/package/1784111021590/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
