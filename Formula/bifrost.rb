class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.8"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.8/bifrost_v1.1.8_linux_x86_64.tar.gz"
    sha256 "25a2f30cd57e6d5fa917e64803545a85ce7c3e8a46bdf4789996374dd143e883"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.8/bifrost_v1.1.8_linux_arm64.tar.gz"
    sha256 "a70a32316f336e6a37407184601766f31b2b998a252755b4765d9d2bfd91d996"
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
