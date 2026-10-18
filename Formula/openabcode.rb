class Openabcode < Formula
  desc "AI coding agent with task routing and hosted gateway"
  homepage "https://openabcode.com"
  license "AGPL-3.0-or-later"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.1/openabcode-darwin-arm64.tar.gz"
      sha256 "57d43005a38ada6dd9a522a43786ae2741f4a4a1048b1b51e548b4daaa2ac8b8"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.1/openabcode-darwin-x64.tar.gz"
      sha256 "6943bc6d7adad7a995845486252d8009942c0789337fdc9ace4842322d2db3f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.1/openabcode-linux-arm64.tar.gz"
      sha256 "26c5a72cfd245f5c7ab96808ee5d34664310bec7f1e7123a49abffaa6e8f0214"
    else
      url "https://github.com/matrixmapai/openabcode/releases/download/v1.1.1/openabcode-linux-x64.tar.gz"
      sha256 "86876e5dc297ac97137358466208ddf1e836567d09f18e3c6a03319faa63685c"
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
