class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  version "1.0.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-arm64.tar.gz"
      sha256 "e34ac2b317e8dec961c698e5e7760d804844e4e4770a4472783c3b882d7a5873"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-x64.tar.gz"
      sha256 "8577d5595ac1c98040ac1515aa311c5aa66bb10c137df27d8927ab972a748ead"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-arm64.tar.gz"
      sha256 "cf7e98850909769a360b8de927ef5ac586732d513aed0561e418dab00fa2b084"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-x64.tar.gz"
      sha256 "4996a74815ebab5f673294f34e9229763f70588ab95af5e0595f9c82796a0902"
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
