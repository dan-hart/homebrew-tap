class Fgm < Formula
  desc "Fast CLI for Figma - export assets, compare designs, extract tokens"
  homepage "https://github.com/dan-hart/fgm"
  url "https://github.com/dan-hart/fgm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fgm #{version}", shell_output("#{bin}/fgm --version")
  end
end
