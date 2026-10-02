class Libresync < Formula
  desc "Device-to-device local-first sync engine and CLI with end-to-end encryption"
  homepage "https://github.com/dan-hart/LibreSync"
  url "https://github.com/dan-hart/LibreSync/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "266e924defb26aa163cd2c4338b438f6ed2149b8f281ed10b0efa9fd79257a58"
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
