class Reprise < Formula
  desc "Fast, feature-rich CLI for Bitrise"
  homepage "https://github.com/dan-hart/reprise"
  url "https://github.com/dan-hart/reprise/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "7f5a0ad5c19a84159cef668d1283dc3f4a2eb478ed81c0588c6d2e4473c3d4be"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "reprise #{version}", shell_output("#{bin}/reprise --version")
  end
end
