class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.2.11.tar.gz"
  sha256 "482212eee175c0c4db1c30bfd3b533eca78a0712591132c05ce929ddc15ce038"
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
