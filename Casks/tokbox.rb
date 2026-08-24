cask "tokbox" do
  version "0.11.0"
  sha256 "5064789253f2a6e052f71869356c0b009a76a83dd8d850acab46e3f12c176d69"

  url "https://yx-web-nosdn.netease.im/package/1787217406912/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
