class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.0/openabcode-darwin-arm64.tar.gz"
      sha256 "04cb3252b1b2359e0bcb6f83731a4196767b2bc14c9f6f84d2f719845cc9f818"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.0/openabcode-darwin-x64.tar.gz"
      sha256 "bf569737b863cfe05df8fb1edfd72ff079962d12141d53de78d99bde06faada7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.0/openabcode-linux-arm64.tar.gz"
      sha256 "151a8def016190d7b4bea73f4afbe54441dd96859e7a71c32e53a109d5542dff"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.0/openabcode-linux-x64.tar.gz"
      sha256 "c3714fe18fe558e3929adfacef43467908f09518569160ffbe1cde817bdd5dc2"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"openabcode" => "openabcode"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openabcode --version")
  end
end
