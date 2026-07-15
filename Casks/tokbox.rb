cask "tokbox" do
  version "0.3.1"
  sha256 "e685a96c0aab2b4e95883c4f3e0fd6e0ab390639213e0dc473c6dadf2615eed1"

  url "https://yx-web-nosdn.netease.im/package/1784113525004/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
