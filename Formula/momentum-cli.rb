# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.16/mo-v0.4.16-macos-universal.tar.gz"
  sha256 "07586883e836ed2bc687c389d6ad484fa4d65e0832d7037e5e6e864b97c9b27a"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.16/mo-v0.4.16-linux-x86_64.tar.gz"
      sha256 "5ab40830504e124603af715bad9c5a40ebe8dff18bd7d3e85ed6cf377a5d4815"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.16/mo-v0.4.16-linux-aarch64.tar.gz"
      sha256 "0cd6aedbfb0f2b585f09250e72f7979b9f9eee45cba188a19b064372c985ec9e"
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
