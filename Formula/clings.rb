class Clings < Formula
  desc "Feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9c9007efe44f36f3ecc561389f844736978e8824df910cf5dd476ae3281f2973"
  license "GPL-3.0-or-later"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/clings"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clings --version")
  end
end
