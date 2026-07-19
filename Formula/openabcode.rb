class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.8/openabcode-darwin-arm64.tar.gz"
      sha256 "da70a144bbe53a7d45dfaf691c1aed4367699c31cc9e8198bd6d087f1869cfb6"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.8/openabcode-darwin-x64.tar.gz"
      sha256 "4b4d48e5fc919bcebe03c2c663f76abd6ff417f2f1df963bebdcada504e01fb1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.8/openabcode-linux-arm64.tar.gz"
      sha256 "3fcba8d5bd87aa3cadd7bc5882828807b67667a0564537dee4bae6fa38d750db"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.8/openabcode-linux-x64.tar.gz"
      sha256 "455c73ec05567e4f9a7ca615740d5bd1e0215bac4f077f16051bb86c5d36b20e"
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
