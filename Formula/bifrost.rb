class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.7"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.7/bifrost_v1.1.7_linux_x86_64.tar.gz"
    sha256 "ad2d5f6e0cd288922c72b8659e4068fc242df57dd69465deddfe3a2ec591d330"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.7/bifrost_v1.1.7_linux_arm64.tar.gz"
    sha256 "324b1f48d5a89e1faa6602cb051c1840eabe594ac84eba5414dd80f63d652d19"
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
