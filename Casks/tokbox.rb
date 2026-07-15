cask "tokbox" do
  version "0.2.1"
  sha256 "6249bf072b503702bcd100eee92469e1f2206005b061294e8ad41723caa6d8f4"

  url "https://yx-web-nosdn.netease.im/package/1784082789240/Tokbox_#{version}_universal.dmg"
  name "Tokbox"
  desc "NetEase IM desktop client"
  homepage "https://tokbox.netease.im/"

  depends_on macos: :big_sur

  app "Tokbox.app"
end
