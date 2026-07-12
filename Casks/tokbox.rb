cask "tokbox" do
  version "0.1.0"
  sha256 "9bfc62d9cc6baf47c04c54227b573eda2bcf4f4e332257cfb75ad0a8913555e5"

  url "https://yx-web-nosdn.netease.im/package/1783860050618/Tokbox-#{version}-universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
