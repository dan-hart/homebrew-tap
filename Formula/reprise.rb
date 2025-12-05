class Reprise < Formula
  desc "A fast, feature-rich CLI for Bitrise"
  homepage "https://github.com/dan-hart/reprise"
  url "https://github.com/dan-hart/reprise/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "0ae4e25519427e2f9746bc66a003a6f2d1ec910632789e68a5fe3ca0f92d58af"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "reprise #{version}", shell_output("#{bin}/reprise --version")
  end
end
