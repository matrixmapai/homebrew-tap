class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  version "1.0.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-arm64.tar.gz"
      sha256 "229f0eda1bebe2d164c1f262c6f51db634881dc7992c946bfff0019d268017b2"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-x64.tar.gz"
      sha256 "5cf35bf4d76068d9cf3897afc96c5c2ad4446c0311f533c6ccd6f0e9504b6c64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-arm64.tar.gz"
      sha256 "ce90a79bcc319e59fcea5974cd388cd63360ae8ffe03b15017456c009db0041a"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-x64.tar.gz"
      sha256 "2977aa4e13f914b773c1d5a3b2ef431eed0cb91ba5b2dd453abd90564882ab6c"
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
