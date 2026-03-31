class Fav < Formula
  desc "Speed-dial for files and folders"
  homepage "https://github.com/dan-hart/homebrew-tap"
  url "https://github.com/dan-hart/homebrew-tap/releases/download/fav-v0.2.0/fav-v0.2.0.tar.gz"
  sha256 "c7741af8ca5954f1067b4893dd571dbed81bac367558618de6db0a23a8ef2a64"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fav #{version}", shell_output("#{bin}/fav --version")
  end
end
