class Emask < Formula
  desc "Mint masked email addresses with Fastmail and DuckDuckGo"
  homepage "https://github.com/dan-hart/emask"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.2/emask-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "32dfc0205a2876acbe90488dca531140d6779b1c6c1aeada5ed9171f8ad62208"
    end

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.2/emask-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "a78c1b58c2ece5a100de2d3f241bc85ec490b9895c1bcab14178dd818f4dacc4"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.2/emask-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cefdb5e5f063e475b6c0f21748052b85ae80808d0065b63b6958ef477d6fd021"
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
