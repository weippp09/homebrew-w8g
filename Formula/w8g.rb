class W8g < Formula
  desc "Self hot update CLI for Flutter apps (w8g)"
  homepage "https://github.com/weippp09/w8g"
  version "0.1.4"

  # 用物理 CPU 架构判断（兼容 Intel 版 Homebrew 跑在 Apple Silicon 上的场景）
  if Hardware::CPU.physical_cpu_arm64?
    # 版本化资产地址（内容不可变，避免 raw/main 缓存导致 sha256 校验失败）
    url "https://github.com/weippp09/w8g/releases/download/v0.1.4/w8g-darwin-arm64.zip"
    sha256 "bf4e4dd0c65455e354e41dc5af1d1b207b185ca6a4b58ae7b03c8817dd5fbcb2"
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
