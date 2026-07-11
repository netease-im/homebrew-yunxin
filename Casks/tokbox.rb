cask "tokbox" do
  version "0.1.0"
  sha256 "61f597181280f3121cf117f7dfce015a8bf32e2d35166abc86e499961749b70e"

  url "https://yx-web-nosdn.netease.im/package/1783762433151/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
