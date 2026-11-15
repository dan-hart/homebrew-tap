# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.20/mo-v0.4.20-macos-universal.tar.gz"
  sha256 "94368c3adf4555b12420368d1090237c98f75a55e302e16a6bcec688b2d6a11f"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.20/mo-v0.4.20-linux-x86_64.tar.gz"
      sha256 "903e15083e1c21afc6d7e96eb903975d1b654b9100665a49bf542fbcfb9cb0f0"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.20/mo-v0.4.20-linux-aarch64.tar.gz"
      sha256 "469f57b026458e3fc4e62ebd3d415c176595208e48c3b934c9985d0992d3e7ce"
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
