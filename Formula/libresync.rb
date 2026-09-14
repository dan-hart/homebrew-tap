class Libresync < Formula
  desc "Device-to-device local-first sync engine and CLI with end-to-end encryption"
  homepage "https://github.com/dan-hart/LibreSync"
  url "https://github.com/dan-hart/LibreSync/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "96090bb60370891ba87c4c3e219f3db5a921107d55c90800bcdc12dca38880aa"
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
