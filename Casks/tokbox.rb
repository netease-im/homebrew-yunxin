cask "tokbox" do
  version "0.6.2"
  sha256 "ea15afe767a0337b1e5a4a79a7c244b641c7ba936cb455f07ad8b17391ba1b2f"

  url "https://yx-web-nosdn.netease.im/package/1784625243233/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
