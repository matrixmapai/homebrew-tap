class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  version "1.0.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-arm64.tar.gz"
      sha256 "78cf989ff6ff521cdc0712a43f6141ff738687a8ffff4b31ad7304a75444aa76"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-darwin-x64.tar.gz"
      sha256 "6e82146333dfe94f7d576e05ba3655f4908e8ecb14419680651e6aff1dd6e0d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-arm64.tar.gz"
      sha256 "cd45a767491a9827171bb4debb8595471ec54969d8867e28c85bf7611f27870c"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v#{version}/openabcode-linux-x64.tar.gz"
      sha256 "eccc5e7488daefb7d08ef2e6d66303faba0b4959db9a7b927a485ee4be279991"
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
