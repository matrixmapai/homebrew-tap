class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.0/openabcode-darwin-arm64.tar.gz"
      sha256 "304eef7549052f7d4216a6f4bd5989f256003817b379b516426c35104f70f279"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.0/openabcode-darwin-x64.tar.gz"
      sha256 "f6ea078aa00fd8f2d1eb99717d6c5dd482f14ecc9c35a11d00bd79b748719e7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.0/openabcode-linux-arm64.tar.gz"
      sha256 "1aa2c7f40538f9725e2cc07e75f35e735e8e27e22a20ac395073d9539bbc39c4"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.0/openabcode-linux-x64.tar.gz"
      sha256 "5b1601e56ebd3ce1f0e54885e02f26eba4650bee0265104380035f1960c1c239"
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
