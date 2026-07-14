cask "tokbox" do
  version "0.2.0"
  sha256 "761311150f26e24bececda3e18485f273ba04cd4713ef65c1fbe7d0e36932506"

  url "https://yx-web-nosdn.netease.im/package/1784009180286/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
