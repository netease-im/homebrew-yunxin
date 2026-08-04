cask "tokbox" do
  version "0.9.0"
  sha256 "b0be05050fc1c09d3a0f5436855274351eb352da4d406d540414d4983d1e7b7b"

  url "https://yx-web-nosdn.netease.im/package/1785842451082/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
