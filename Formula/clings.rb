class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "b35812c0607105e13026b6d04f647057c40ec5d652315f48af8baa416a4c4ec8"
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
