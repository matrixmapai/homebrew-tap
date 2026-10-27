class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.2/openabcode-darwin-arm64.tar.gz"
      sha256 "c0643696c69f5cee02e20fbc9c6606cf34656cccd31b5ed4014ee24efe541204"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.2/openabcode-darwin-x64.tar.gz"
      sha256 "b7952d9fd87d566c8ca22112d96096a1d35319713c5af9cb7ea405d9029fff8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.2/openabcode-linux-arm64.tar.gz"
      sha256 "971ccd8721d1c8389976ad1566a9710799af3bf59c11df3f5977a90e2673959d"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.2/openabcode-linux-x64.tar.gz"
      sha256 "a07273515c059bd0eb5b4a4ceda088f7c9d6a0dcb2f0579a65088422e69fa079"
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
