class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "03bf46ed115213bd2899cb361dc719a424031f652b97a7bbfeca25b8ec86f09f"
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
