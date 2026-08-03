cask "tokbox" do
  version "0.8.0"
  sha256 "ca1596ebdb593e6e14c677f1b4e202703dffa67df047167a25eaa558ef95d2c9"

  url "https://yx-web-nosdn.netease.im/package/1785578685474/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
