cask "tokbox" do
  version "0.4.0"
  sha256 "163a23e0371e80f0cb4186341e676ae900561ff4ce1106f54246d0c9efcb17b1"

  url "https://yx-web-nosdn.netease.im/package/1784282859402/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
