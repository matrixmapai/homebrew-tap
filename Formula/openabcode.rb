class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.1/openabcode-darwin-arm64.tar.gz"
      sha256 "a8e187eaee08f809f51f31e3792be6b593e581469cbeadeaf102ce032c0a6e04"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.1/openabcode-darwin-x64.tar.gz"
      sha256 "e0d1c60d62f5f79777046c151202c47696d39d2282aa2ee92a4c75b5f5164705"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.1/openabcode-linux-arm64.tar.gz"
      sha256 "532a53512385b213859173a49910bf9162251b774dd3a730f31e8d6373d7de01"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.3.1/openabcode-linux-x64.tar.gz"
      sha256 "8b9d4ebdb1f95b43f90feb57cfc46e5e3e83240ce748f887e8d38ff71adefa99"
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
