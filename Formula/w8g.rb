class W8g < Formula
  desc "Self hot update CLI for Flutter apps (w8g)"
  homepage "https://github.com/weippp09/w8g"
  version "0.1.0"

  if Hardware::CPU.arm?
    url "https://github.com/weippp09/w8g/releases/download/v0.1.0/w8g-darwin-arm64.zip"
    sha256 "49036fc346e2d54655506691946ba72f29f3871e16ee6cbd09ab07067e132c3a"
  else
    odie "w8g 目前仅提供 macOS arm64 二进制，请使用 Apple Silicon Mac 安装"
  end

  def install
    bin.install "w8g"
  end

  test do
    assert_match(/w8g/, shell_output("#{bin}/w8g --version"))
  end
end
