cask "macing" do
  version "1.0"
  sha256 "106ebaf181fb912f23ff2275b88b07b2d6af2afaa4b731a5fe5bb80f5558f040"

  url "https://raw.githubusercontent.com/ankitvashisht12/macing/de69734f2ea813d16b6c725c62d905dfb0020367/website/public/Macing.dmg"
  name "Macing"
  desc "Mechanical keyboard sounds for your Mac"
  homepage "https://github.com/ankitvashisht12/macing"

  depends_on macos: :ventura

  app "Macing.app"

  caveats <<~EOS
    macOS may block the first launch of Macing. If you see “Macing” Not Opened,
    click Done, then go to System Settings → Privacy & Security → Security.
    If Open Anyway appears for Macing, click it and confirm.
  EOS
end
