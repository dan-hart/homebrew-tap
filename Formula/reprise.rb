class Reprise < Formula
  desc "Fast, feature-rich CLI for Bitrise"
  homepage "https://github.com/dan-hart/reprise"
  url "https://github.com/dan-hart/reprise/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "2c995cddf77d0e079a6de9ff112b4bd11f5f0e9e1443393e9ccff2df9bb461f7"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "reprise #{version}", shell_output("#{bin}/reprise --version")
  end
end
