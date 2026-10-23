# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.13/mo-v0.4.13-macos-universal.tar.gz"
  sha256 "369a8024a575ff88e5e1b1d87e3d6d86245afac2f458b451bf751ae277533cb3"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.13/mo-v0.4.13-linux-x86_64.tar.gz"
      sha256 "3d15e691d558ebe1ff2015e76e420834e7d3471a1d2657bc839d40da7974beb4"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.13/mo-v0.4.13-linux-aarch64.tar.gz"
      sha256 "d910f0f956c4091eb6bcd1d26c1c6c6e91c08d28e5f423d2990d2e956ecabd24"
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
