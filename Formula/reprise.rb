class Reprise < Formula
  desc "Fast, feature-rich CLI for Bitrise"
  homepage "https://github.com/dan-hart/reprise"
  url "https://github.com/dan-hart/reprise/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "701e5830edc96cc571884390117797ee6316638e026e18aa3c19bffd4ce7a6f5"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "reprise #{version}", shell_output("#{bin}/reprise --version")
  end
end
