class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.6"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.6/bifrost_v1.1.6_linux_x86_64.tar.gz"
    sha256 "43d17946578f43e806d7dbeda844d72400b97b7a6d6763aeb7d9f4ccd84f3492"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.6/bifrost_v1.1.6_linux_arm64.tar.gz"
    sha256 "af553cabf14c591fe56e4314614582c1231a5b7376f426c9fec02380965a5ced"
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
