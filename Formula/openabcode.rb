class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.7/openabcode-darwin-arm64.tar.gz"
      sha256 "8bb9019c99249dbbcdae5c0d24cc2cf42bc6707028330d9209efb6036c5cceb3"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.7/openabcode-darwin-x64.tar.gz"
      sha256 "5bcfdbcb6a02c3e80e5d8e07160839ab167b764a2227765d0c58f234b2357947"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.7/openabcode-linux-arm64.tar.gz"
      sha256 "d68226981ebfde1fab14809892b2a360f3f2f5fca9fa9eb50a2f4d82c56b280a"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.7/openabcode-linux-x64.tar.gz"
      sha256 "0ce05cf2bec9f123aa94bf3a355e25f8bb4c95a177a28465c8626b6637b30cba"
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
