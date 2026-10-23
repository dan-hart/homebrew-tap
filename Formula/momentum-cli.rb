# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.12/mo-v0.4.12-macos-universal.tar.gz"
  sha256 "338b1c4b06148e7f8a213d05a641db3160898d9c4e6462451ebdf4e5e455c388"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.12/mo-v0.4.12-linux-x86_64.tar.gz"
      sha256 "8310186cb427bf2f1d537eee700b1abe6764b8e36b64af09def67b2340695d72"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.12/mo-v0.4.12-linux-aarch64.tar.gz"
      sha256 "72cb185c4967c83e545472d775927075d404ac98f2654aa62957fd63331c02f9"
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
