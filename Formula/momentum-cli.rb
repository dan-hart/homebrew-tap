# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.17/mo-v0.4.17-macos-universal.tar.gz"
  sha256 "5916c9879dc8366efc3fda91fe0f92f81c22d1a9cba1ab1dda8409dfd925b41c"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.17/mo-v0.4.17-linux-x86_64.tar.gz"
      sha256 "9b1f33a26ae78e30ad90fb2ac40d05746337c6dd88b79688327d831f109cf17e"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.17/mo-v0.4.17-linux-aarch64.tar.gz"
      sha256 "1a25571fd1e8f161358f3f72a3da4e13455b90dca0180fbd677fcad15bb8693c"
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
