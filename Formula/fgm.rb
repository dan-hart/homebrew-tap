class Fgm < Formula
  desc "Fast CLI for Figma - export assets, compare designs, extract tokens"
  homepage "https://github.com/dan-hart/fgm"
  url "https://github.com/dan-hart/fgm/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "cd87d0ae2f6e70b3793d63e0fc6edf45762b21d0190983af89cce2da0f127388"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fgm #{version}", shell_output("#{bin}/fgm --version")
  end
end
