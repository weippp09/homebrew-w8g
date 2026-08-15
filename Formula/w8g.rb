class W8g < Formula
  desc "Self hot update CLI for Flutter apps (w8g)"
  homepage "https://github.com/weippp09/w8g"
  version "0.1.1"

  # 用物理 CPU 架构判断（兼容 Intel 版 Homebrew 跑在 Apple Silicon 上的场景）
  if Hardware::CPU.physical_cpu_arm64?
    url "https://github.com/weippp09/w8g/releases/download/v0.1.1/w8g-darwin-arm64.zip"
    sha256 "a2f155e8af4f4c07a3f0ceac74e066133fe70ef20d8f5d94a890f6a2da5bfd10"
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
