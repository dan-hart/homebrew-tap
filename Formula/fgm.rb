class Fgm < Formula
  desc "Fast CLI for Figma - export assets, compare designs, extract tokens"
  homepage "https://github.com/dan-hart/fgm"
  url "https://github.com/dan-hart/fgm/archive/refs/tags/v1.3.3.tar.gz"
  sha256 "43f835c57615ae066401334fa2bfd67187f3b65a61030ad6843fe6b04bbd0b70"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fgm #{version}", shell_output("#{bin}/fgm --version")
  end
end
