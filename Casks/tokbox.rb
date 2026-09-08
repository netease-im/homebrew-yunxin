cask "tokbox" do
  version "0.11.1"
  sha256 "72e735feeb875e63c51bc283ddda43b27a7f989c39260aa76aa004e81d938a1d"

  url "https://yx-web-nosdn.netease.im/package/1787622224204/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
