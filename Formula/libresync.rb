class Libresync < Formula
  desc "Device-to-device local-first sync engine and CLI with end-to-end encryption"
  homepage "https://github.com/dan-hart/LibreSync"
  url "https://github.com/dan-hart/LibreSync/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "a024d14001c5827564b4cb42a338f27b5b7aadb84ea7326279d89ece62730dcf"
  license "AGPL-3.0-only"
  head "https://github.com/dan-hart/LibreSync.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/libresync-cli")
  end

  test do
    assert_match "libresync #{version}", shell_output("#{bin}/libresync --version")
  end
end
