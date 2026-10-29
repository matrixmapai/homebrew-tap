class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.2.0/openabcode-darwin-arm64.tar.gz"
      sha256 "f089bc7bc792b22499202a2f4360bb01dca40dcabb663c1b854ddade14c2767c"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.2.0/openabcode-darwin-x64.tar.gz"
      sha256 "ba9025183d4f9aba9e927a226b9d340635f534b43f5f2988e80156e80216c118"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.2.0/openabcode-linux-arm64.tar.gz"
      sha256 "0a320e20c7bada4d26c238a28a3e7b2b96c93d2d160a6aaaed6ad5d10db6d583"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.2.0/openabcode-linux-x64.tar.gz"
      sha256 "c9a721e4f62dc13689f9712904978b54a50d73bcc5b472f8a9a39d8dcc9df4de"
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
