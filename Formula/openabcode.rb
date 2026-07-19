class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.9/openabcode-darwin-arm64.tar.gz"
      sha256 "c0806b0a29f47ec49f3a5bd4861a9fc36d7256db0d8c6763edcda986d95f4d8f"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.9/openabcode-darwin-x64.tar.gz"
      sha256 "1453011de1fbf98b0865f9561eea572f650df1fd97a350874cdd41e17704c17e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.9/openabcode-linux-arm64.tar.gz"
      sha256 "4584b89cd0fdf326eb20ce1daa7ec03c5e2aa9354cabb64c6ce2e1fec3857f8b"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.9/openabcode-linux-x64.tar.gz"
      sha256 "b45b329ecdfa13c852098ec2c047268a856cfe9fd894b8473fcdb751b6c5eaec"
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
