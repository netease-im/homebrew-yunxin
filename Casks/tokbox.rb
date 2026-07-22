cask "tokbox" do
  version "0.7.0"
  sha256 "70b6d2190ee1dd25c9332a705ac6c4daefe08d2d4c1467ca4308f34a9089b3e8"

  url "https://yx-web-nosdn.netease.im/package/1784713438909/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
