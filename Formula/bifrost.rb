class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.2.1"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.2.1/bifrost_v1.2.1_linux_x86_64.tar.gz"
    sha256 "c96f24d92a8bafb8aa1935212a9d9442f47e98407232ed2296f2735e0d38c423"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.2.1/bifrost_v1.2.1_linux_arm64.tar.gz"
    sha256 "b84458fe289d1a619aff576580094d40b9c226dfa4f9575c81313f6993e3b62e"
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
