class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.5/openabcode-darwin-arm64.tar.gz"
      sha256 "2b95611fa1c10fa9769095b4bf0bc8bb21d86e8eaf3b3e22097b0730ddec65f4"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.5/openabcode-darwin-x64.tar.gz"
      sha256 "585d7678c1fbbc6a648fc0088bdfbe1d80ecbb12c8468ee96c9039d7b9ef8b2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.5/openabcode-linux-arm64.tar.gz"
      sha256 "e742f54fd52cff7974effef979b1fbf03f8720e2ccd2fcf87996b6e4ce0e0412"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.0.5/openabcode-linux-x64.tar.gz"
      sha256 "32e1a1861d7f3966dac6eb9d27276c8376062fb8186f7580d093df974a7a39b7"
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
