# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# Installs the prebuilt `mo` from the GitHub Release, so no Rust toolchain or LibreSync
# checkout is needed: brew install dan-hart/tap/momentum-cli
#
# The universal Mac archive is the default; Linux selects its native architecture.
# The `momentum` cask installs the same `mo`, so install one or the other.
class MomentumCli < Formula
  desc "Command-line companion for Momentum: add, list, complete and sync tasks"
  homepage "https://github.com/dan-hart/momentum"
  url "https://github.com/dan-hart/momentum/releases/download/v0.4.14/mo-v0.4.14-macos-universal.tar.gz"
  sha256 "454ccde79fda7f134247f8629699d5535a4ef07ac520e602d5f8bd3335ed4ded"
  license "GPL-3.0-or-later"

  on_linux do
    on_intel do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.14/mo-v0.4.14-linux-x86_64.tar.gz"
      sha256 "79eaf2e98d86af3014cd1a18e09dcae1bd7924e6919f32d062960c3f23d7baea"
    end
    on_arm do
      url "https://github.com/dan-hart/momentum/releases/download/v0.4.14/mo-v0.4.14-linux-aarch64.tar.gz"
      sha256 "8b33eadf6854fdb4a18695e82975ee203deef499e3ab2c8c448a331d0d219bfb"
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
