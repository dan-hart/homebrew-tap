class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "dc56ed57f3774ea036e60e5c623f981ed3442124458efe1a6ec7b51a9ea94023"
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
