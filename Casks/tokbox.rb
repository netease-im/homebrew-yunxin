cask "tokbox" do
  version "0.7.2"
  sha256 "b7875606969f0fd959a51ea794694267ec1bb14ab9a87c0182773b07f7379f26"

  url "https://yx-web-nosdn.netease.im/package/1785297229228/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
