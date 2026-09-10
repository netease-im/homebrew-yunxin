cask "tokbox" do
  version "0.12.0"
  sha256 "ecd65a02728a4f8d53d88578331510c9f25bb264866f30f83a914a8cd062717b"

  url "https://github.com/netease-im/tokbox-releases/releases/download/#{version}/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
