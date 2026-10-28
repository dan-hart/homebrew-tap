class Emask < Formula
  desc "Mint masked email addresses with Fastmail and DuckDuckGo"
  homepage "https://github.com/dan-hart/emask"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.3/emask-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "1f6ba984e994da264feb4d792ad939ea268699fe99b5c7d980286ab4ab8c0324"
    end

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.3/emask-0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "d29b7bbdcbc9b04ad3b8b3542bb1a3ea5193b973b3798ca6260cee096ea28339"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.3/emask-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "599ef97d3f440b7f17e2b246e6c538f9346f3a2a0e531b3369600188511b1a2b"
    end
  end

  def install
    bin.install "emask"
    doc.install "README.md", "CHANGELOG.md", "CONTRIBUTING.md", "SECURITY.md", "LICENSE", "docs"
    generate_completions_from_executable(bin/"emask", "completions")
  end

  def caveats
    <<~EOS
      Connect your email services:
        emask setup

      View commands and Homebrew installation help:
        emask --help

      Installed Homebrew guide:
        #{doc}/docs/homebrew.md
    EOS
  end

  test do
    assert_path_exists doc/"docs/homebrew.md"
    assert_path_exists doc/"docs/shortcuts.md"
    assert_match "emask #{version}", shell_output("#{bin}/emask --version")
    config = testpath/"config.toml"
    assert_equal "#{config}\n", shell_output("#{bin}/emask --config #{config} config path")
    assert_match "requires an interactive terminal", shell_output("#{bin}/emask setup 2>&1", 1)
    refute_path_exists config
  end
end
