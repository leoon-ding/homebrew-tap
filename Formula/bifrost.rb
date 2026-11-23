class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.3.1"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.3.1/bifrost_v1.3.1_linux_x86_64.tar.gz"
    sha256 "2be28cbae57e4a1b24204ef9cc97b80997f942118ddf9d3fbe8ea9aa174bda81"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.3.1/bifrost_v1.3.1_linux_arm64.tar.gz"
    sha256 "b79a7018d3960bd43c8cd794d0931f3cbdac9ec51fab3a49461e7cb59a7f3ec9"
  end

  def install
    bin.install "bifrost"
  end

  def caveats
    <<~EOS
      Initialize the default configuration first:
        bifrost config init

      Configuration is stored in ~/.bifrost/configure.json.
      Edit this file after initialization.
    EOS
  end

  test do
    system "#{bin}/bifrost", "--version"
  end
end
