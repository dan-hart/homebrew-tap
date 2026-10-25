class Clings < Formula
  desc "Feature-rich CLI for Things 3 on macOS"
  homepage "https://github.com/dan-hart/clings"
  url "https://github.com/dan-hart/clings/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "918a1077c87ca5122151af91a5edfd17f67ab11b5b9a064a4637400fd960571e"
  license "GPL-3.0-or-later"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sonoma

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox", "--force-resolved-versions"
    bin.install ".build/release/clings"
    generate_completions_from_executable(bin/"clings", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clings --version")
  end
end
