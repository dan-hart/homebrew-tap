class Reprise < Formula
  desc "A fast, feature-rich CLI for Bitrise"
  homepage "https://github.com/dan-hart/reprise"
  url "https://github.com/dan-hart/reprise/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "e3acae03c28def1db0e5be334c27eab3b33e874e2004f4a6f09deb7922d665f3"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "reprise #{version}", shell_output("#{bin}/reprise --version")
  end
end
