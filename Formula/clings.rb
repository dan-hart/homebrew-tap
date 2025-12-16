class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "6e04262ebd715c849b2fb945cc4792596043e291acedc0ba3b1ae6c4331f7d72"
  license "GPL-3.0-or-later"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/clings"
  end

  test do
    assert_match "clings #{version}", shell_output("#{bin}/clings --version")
  end
end
