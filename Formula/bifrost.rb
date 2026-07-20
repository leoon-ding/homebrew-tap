class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.10"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.10/bifrost_v1.1.10_linux_x86_64.tar.gz"
    sha256 "e22369a1398803f185f70b608c5e290bdc2389290ff5fc12cc308c09f22d23ab"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.10/bifrost_v1.1.10_linux_arm64.tar.gz"
    sha256 "81c7a3e28d9774bed1b72685efc80079053e7439e48dc90793752a08d65da7b4"
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
