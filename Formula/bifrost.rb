class Bifrost < Formula
  desc "Cross-platform collaboration tool for file transfer, sharing, and synchronization"
  homepage "https://www.databifrost.com"
  version "1.3.0"
  license :cannot_represent

  depends_on :linux

  if Hardware::CPU.intel?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.3.0/bifrost_v1.3.0_linux_x86_64.tar.gz"
    sha256 "99ca4da2f42eb342b1d5163db258d35d1b18c229b5a869980c0b55f7ae0423d8"
  elsif Hardware::CPU.arm?
    url "https://github.com/leoon-ding/homebrew-tap/releases/download/bifrost/v1.3.0/bifrost_v1.3.0_linux_arm64.tar.gz"
    sha256 "9da5778684ee884512c644ed9fc9345d4738290243cc328e4c70bb87e80290e0"
  end

  def install
    bin.install "bifrost"
  end

  def caveats
    <<~EOS
      Initialize the default configuration first:
        bifrost config init

      Configuration is stored in ~/.bifrost/configure.json.
      Edit this file after initialization.
    EOS
  end

  test do
    system "#{bin}/bifrost", "--version"
  end
end
