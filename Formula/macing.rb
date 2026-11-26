class Macing < Formula
  desc "Mechanical keyboard sounds for your Mac"
  homepage "https://github.com/ankitvashisht12/macing"
  url "https://codeload.github.com/ankitvashisht12/macing/tar.gz/6c0b3e23b05ea272af74bc0a6c19a99cb118f78c"
  version "1.0"
  sha256 "cdd8bb439d5dfcfd5ecfa5e9acaa4437c8b156848ba01bc6c9df76963a2398d6"
  license "MIT"

  depends_on macos: :ventura

  def install
    system "bash", "build.sh"
    libexec.install "Macing.app"

    (bin/"macing").write <<~SH
      #!/bin/sh
      exec /usr/bin/open "#{opt_libexec}/Macing.app"
    SH
  end

  def caveats
    <<~EOS
      Run macing to open the menu bar app.
      Allow Macing in System Settings → Privacy & Security → Input Monitoring
      to play sounds while you type.
    EOS
  end

  test do
    app = libexec/"Macing.app"
    assert_predicate app/"Contents/MacOS/Macing", :executable?
    system "/usr/bin/codesign", "--verify", "--strict", app
  end
end
