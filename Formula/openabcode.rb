class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.6/openabcode-darwin-arm64.tar.gz"
      sha256 "6e245ddb6f29646a9dc91798c58f854c58603a7729f16e5a9554cec4afa987b8"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.6/openabcode-darwin-x64.tar.gz"
      sha256 "1d080fa80480db9e729b0777df37ac954faaf6af1a9626cf58b571effee37c82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.6/openabcode-linux-arm64.tar.gz"
      sha256 "5d0b4dbf5fa353588eed72f6d2ee5a3c30530270d4ebe2e6632c29fa89ca608d"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.6/openabcode-linux-x64.tar.gz"
      sha256 "b7c3ee4253d6836cc1c0741b0195014793aef55f77bd5c0bbca453c8da4540e1"
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
