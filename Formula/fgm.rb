class Fgm < Formula
  desc "Fast CLI for Figma - export assets, compare designs, extract tokens"
  homepage "https://github.com/dan-hart/fgm"
  url "https://github.com/dan-hart/fgm/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "a22fdfffd7719b54f691c3498024f8f7c67c167bd88c0b9b15ebca1ee1831c0c"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fgm #{version}", shell_output("#{bin}/fgm --version")
  end
end
