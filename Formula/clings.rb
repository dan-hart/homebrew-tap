class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "215d7c72361de24aeb4bbf8070143a669261e7a6964d29aa454b181baaf3b37c"
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
