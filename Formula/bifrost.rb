class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.2.0"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.2.0/bifrost_v1.2.0_linux_x86_64.tar.gz"
    sha256 "aed189efd7eca9ba1c4730156190567fbf1471f92e6a48b5ef100123cf2bf7b5"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.2.0/bifrost_v1.2.0_linux_arm64.tar.gz"
    sha256 "84ab96ca2fd3289eea199590414d652f5b57176f25ed454bacbafe63071dc59d"
  end

  def install
    bin.install "bifrost", "bifrost-ctl"
  end

  def caveats
    <<~EOS
      Initialize the default configuration first:
        bifrost-ctl init

      Enable the per-user systemd service:
        bifrost-ctl enable

      Configuration is stored in ~/.bifrost/configure.json.
      Edit this file after initialization.
    EOS
  end

  test do
    system "#{bin}/bifrost", "--version"
  end
end
