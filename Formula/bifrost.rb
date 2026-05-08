class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.5"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.5/bifrost_v1.1.5_linux_x86_64.tar.gz"
    sha256 "63d0ee80ab750e84980262d00323c06315550f24b73f5d6fa44d5b93ce9a80b2"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.5/bifrost_v1.1.5_linux_arm64.tar.gz"
    sha256 "6eec3fd341426d4b99120e3900f48c4b6889731528f94f0768d0719f275146ec"
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
