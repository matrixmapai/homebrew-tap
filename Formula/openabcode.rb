class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.4/openabcode-darwin-arm64.tar.gz"
      sha256 "94af94ae03ee86460c69f53628de49ec70dcb76e85d7385d3c8bd08650f78718"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.4/openabcode-darwin-x64.tar.gz"
      sha256 "95a087304ce99c9ef4f47d0afeeefc211637e500fe191e646ca821df0c331742"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.4/openabcode-linux-arm64.tar.gz"
      sha256 "9bf2dcc8859ed5ff328744cbdc1a4b8f193a9551a0bdea21e4c5d5c23489f288"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.4/openabcode-linux-x64.tar.gz"
      sha256 "4886a502ce64422995d0bdcf862d516cfc934f679275ab1bafb3fde5be9b8bbd"
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
