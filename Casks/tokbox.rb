cask "tokbox" do
  version "0.13.1"
  sha256 "aa5fbfb2b262ff381d570ef0b8d03e6fd726b1b68a4858bbff8ca2a27b7ac291"

  url "https://github.com/netease-im/tokbox-releases/releases/download/#{version}/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
