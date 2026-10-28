class Emask < Formula
  desc "Mint masked email addresses with Fastmail and DuckDuckGo"
  homepage "https://github.com/dan-hart/emask"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.1/emask-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "53ff5034683b68034b2a1885c423505b62f16b59997b5ef57cf5b70c710567cd"
    end

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.1/emask-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "95583e7d0dc996b59064c84506c0f76a9648d31c7c1f711616e3e05ae748f42c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/dan-hart/emask/releases/download/v0.1.1/emask-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "407497c29daeaa827facfae988c9acd78a7980f269286a2330e37a3e40fdbf94"
    end
  end

  def install
    bin.install "emask"
    doc.install "README.md", "CHANGELOG.md"
    generate_completions_from_executable(bin/"emask", "completions")
  end

  test do
    assert_match "emask #{version}", shell_output("#{bin}/emask --version")
    config = testpath/"config.toml"
    assert_equal "#{config}\n", shell_output("#{bin}/emask --config #{config} config path")
    assert_match "requires an interactive terminal", shell_output("#{bin}/emask setup 2>&1", 1)
    refute_path_exists config
  end
end
