class Fgm < Formula
  desc "Fast CLI for Figma - export assets, compare designs, extract tokens"
  homepage "https://github.com/dan-hart/fgm"
  url "https://github.com/dan-hart/fgm/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "118529b4b5d68833a09259d1d37639ae4006f4a23894cb595d3d944c4fcb8626"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fgm #{version}", shell_output("#{bin}/fgm --version")
  end
end
