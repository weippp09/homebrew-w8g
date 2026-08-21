class W8g < Formula
  desc "Self hot update CLI for Flutter apps (w8g)"
  homepage "https://github.com/weippp09/w8g"
  version "0.1.2"

  # 用物理 CPU 架构判断（兼容 Intel 版 Homebrew 跑在 Apple Silicon 上的场景）
  if Hardware::CPU.physical_cpu_arm64?
    url "https://github.com/weippp09/w8g/raw/main/w8g-darwin-arm64.zip"
    sha256 "444c18d7ec2be478f3abbf240c8217c6c2de4f10c8da8c6be7e429f09750e23a"
  else
    odie "w8g 目前仅提供 macOS arm64 二进制，请使用 Apple Silicon Mac 安装"
  end

  def install
    bin.install "w8g"
    bin.install "patch_cli_bin"
  end

  test do
    assert_match(/w8g/, shell_output("#{bin}/w8g --version"))
  end
end
