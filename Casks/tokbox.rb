cask "tokbox" do
  version "0.3.1"
  sha256 "28a645d51ca197e88e063596b3d8cbfa5f3e65dd1d8e94f37d6ef562e763845c"

  url "https://yx-web-nosdn.netease.im/package/1784120034252/Tokbox-#{version}-universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
