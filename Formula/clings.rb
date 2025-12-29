class Clings < Formula
  desc "A feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.2.8.tar.gz"
  sha256 "58f61af7533b8c405f288116671df2bbec69e2e99894f31bdc01756a23bb78ba"
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
