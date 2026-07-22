cask "tokbox" do
  version "0.7.1"
  sha256 "c3131c7bf548563139de35e3fde2bec303366d67ee472ca113ca378b43e8fdbd"

  url "https://yx-web-nosdn.netease.im/package/1784818750977/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
