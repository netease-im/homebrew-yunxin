cask "tokbox" do
  version "0.12.1"
  sha256 "977e983e0d743b2e032f096e0715490424c436c132df92d2d5ff09a27909c595"

  url "https://github.com/netease-im/tokbox-releases/releases/download/#{version}/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
