class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "877a497829b5918cc38ad9fdee58b9cbd198e8b23ac1ec46f6533e4c99e696b3"
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
