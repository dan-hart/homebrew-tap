# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# `brew audit --strict` notes that `url` inside `on_macos`/`on_linux` is not the
# homebrew-core layout; the DSL accepts it and this is the usual shape for a tap that
# ships prebuilt binaries per platform. The `momentum` cask installs the same `mo`, so
# install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    url "https://github.com/dan-hart/momentum/releases/download/v#{version}/mo-v#{version}-macos-universal.tar.gz"
    sha256 "236247f3d47676c7506aa5824c17753edf9b0b8b7943fdb6bd13d9178ad706ca"
  end

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v#{version}/mo-v#{version}-linux-x86_64.tar.gz"
      sha256 "c0314655d086e35fe4d547e72dc0bdd2a7b321bd71c25dc8fabd649e616b5e5c"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v#{version}/mo-v#{version}-linux-aarch64.tar.gz"
      sha256 "e4c15118716671f3634dd8ae981c8abb45dfef65904f108603b1b454cb5e3b6f"
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
