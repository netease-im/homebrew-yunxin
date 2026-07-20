cask "tokbox" do
  version "0.6.0"
  sha256 "3782d13369ef0a870c04f3db659cb414736299cd266daa0d5774bafd0157b610"

  url "https://yx-web-nosdn.netease.im/package/1784553930730/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
