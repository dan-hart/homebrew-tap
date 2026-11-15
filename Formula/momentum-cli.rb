# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.23/mo-v0.4.23-macos-universal.tar.gz"
  sha256 "f16817b5fdf4cacb03759766d5bdcfa3992b4559491438fb740b99fc123d4f3d"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.23/mo-v0.4.23-linux-x86_64.tar.gz"
      sha256 "296ee347476fdb96ac74fc6e3d13566b8c102e3593f51ff1d62ca28579868841"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.23/mo-v0.4.23-linux-aarch64.tar.gz"
      sha256 "5d047b89b14463fc2d5aa274cae4aafc2a88c9e6b356d258db7c4149bed0d9f0"
    end
  end

  def install
    bin.install "mo"
  end

  def caveats
    return unless OS.linux?

    <<~EOS
      mo keeps sync passwords in the Secret Service keyring over libdbus-1, which
      every desktop distribution ships. The Momentum app itself is a Flatpak:
        flatpak install --user https://dan-hart.github.io/momentum/momentum.flatpakref
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mo --version")
  end
end
