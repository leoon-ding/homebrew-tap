class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.1.5-beta"
  license "MIT"

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.5-beta/bifrost_v1.1.5-beta_linux_x86_64.tar.gz"
    sha256 "9d5e0cd0b541a683daf155d7fe186b7ed51c20db7302233abe186276f54db162"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.1.5-beta/bifrost_v1.1.5-beta_linux_arm64.tar.gz"
    sha256 "e531f6653baa5ef9cfc29521013558eff9cbf7870619bcce3871af4cd97db4a1"
  end

  def install
    bin.install "bifrost", "bifrost-ctl"
  end

  def caveats
    <<~EOS
      Configuration is stored in ~/.bifrost/configure.json.
      Edit this file after installation.
    EOS
  end

  test do
    system "#{bin}/bifrost", "--version"
  end
end
