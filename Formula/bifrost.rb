class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.9"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.9/bifrost_v1.1.9_linux_x86_64.tar.gz"
    sha256 "d0ca7dae09edcc7a1f133307ada421111a59fcb1689f175296f4b65773a694a4"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.9/bifrost_v1.1.9_linux_arm64.tar.gz"
    sha256 "948660e85b01a8a7b740cd9630bf2727f7d8d199f4d47aae498d1ad902e37ab0"
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
