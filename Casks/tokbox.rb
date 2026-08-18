cask "tokbox" do
  version "0.10.0"
  sha256 "e83719c7bf355c77a30ff1d3db72830db5b503deae4a23a088e587933c358783"

  url "https://yx-web-nosdn.netease.im/package/1787018640193/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
