class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.8"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.8/bifrost_v1.1.8_linux_x86_64.tar.gz"
    sha256 "79f5598886fdbae1ee456afc34d64cd7e24348dc4f6f386f974181e4f3051fe9"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.8/bifrost_v1.1.8_linux_arm64.tar.gz"
    sha256 "afbd396aae96f2d3262ac2b83570a92fd465046a4b03463de7ca5e24863c0d9c"
  end

  def install
    bin.install "bifrost", "bifrost-ctl"
  end

  def caveats
    <<~EOS
      Initialize the default configuration first:
        bifrost-ctl init

      Configuration is stored in ~/.bifrost/configure.json.
      Edit this file after initialization.
    EOS
  end

  test do
    system "#{bin}/bifrost", "--version"
  end
end
