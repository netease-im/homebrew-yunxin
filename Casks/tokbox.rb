cask "tokbox" do
  version "0.3.2"
  sha256 "15d9f26454dedb79947bc3fbcf522f398ab7843f119ad4fa394808632518d49d"

  url "https://yx-web-nosdn.netease.im/package/1784172446979/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
