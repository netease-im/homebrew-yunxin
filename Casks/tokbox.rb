cask "tokbox" do
  version "0.2.2"
  sha256 "ae0b5b6cf4c78b35fc0dead18465e306c0c2c7ff0296a8340a1c5d3079613ef5"

  url "https://yx-web-nosdn.netease.im/package/1784092131963/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
