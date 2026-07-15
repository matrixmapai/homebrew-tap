class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  version "1.0.3"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-arm64.tar.gz"
      sha256 "253a96adbf886d1809eec2493c836f49593278f20ccda8d63f0cfa64b4afdf44"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-x64.tar.gz"
      sha256 "cd284583c7959862e1464e2d757ee69d2051edf4e4d9c5c48d1a129536bd9741"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-arm64.tar.gz"
      sha256 "c0ad42a206ce651fdfd12de444927df80f8acf91dc62783f831ebc282a6d1628"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-x64.tar.gz"
      sha256 "9b5a7f04d0de89e3207423f5d75fb7693545f464e424657c41f44433ba3b2bce"
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
