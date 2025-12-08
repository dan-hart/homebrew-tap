class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "9df03dac71b58025c6f9b8d9c1b57c75f0e8af01433b63d43b97b884834a545f"
  license "GPL-3.0-only"

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "clings #{version}", shell_output("#{bin}/clings --version")
  end
end
