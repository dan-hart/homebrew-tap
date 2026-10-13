# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.11/mo-v0.4.11-macos-universal.tar.gz"
  sha256 "d088eeec7bc5cdeed3cd5288cbde4d6a365e3f691f5765ea7bd985001db27524"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.11/mo-v0.4.11-linux-x86_64.tar.gz"
      sha256 "d366793f40d492f7341ee0a2253ffe1f79f281b16f7c912fc1208107b2f2eb3e"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.11/mo-v0.4.11-linux-aarch64.tar.gz"
      sha256 "866237e095ba2f5dd8954443b3e1b5e2bfe765e79891e1c3dfa2d972a6b3a2d9"
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
