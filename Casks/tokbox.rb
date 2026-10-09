cask "tokbox" do
  version "0.13.0"
  sha256 "5c3b7b1ae2045d10b7268d9cea881bb0b3a7e247ffc21d434282070695bf334e"

  url "https://github.com/netease-im/tokbox-releases/releases/download/#{version}/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
