class Emask < Formula
  desc "Mint masked email addresses with Fastmail and DuckDuckGo"
  homepage "https://github.com/dan-hart/emask"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.4/emask-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "de38e71e3c955b8c55217afd4c86ca5093deb07c1c653d054017fbeb8c31ce93"
    end

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.4/emask-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "44fe0c42ec06de1814d1528cc1b986607f4611c584250a5804bf16a21692f35a"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.4/emask-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f6ffa3944242b5197046dd4a8bc6e064975957e19bde85ac97818cd9049c839"
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
