cask "tokbox" do
  version "0.11.0"
  sha256 "62bef8d2c967e402046e6173a81cb8f18707f260ce8f4bcdc4b1c67b8cf7a5d9"

  url "https://yx-web-nosdn.netease.im/package/1787108878322/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
