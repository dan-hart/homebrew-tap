# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# brew install --cask dan-hart/tap/momentum
cask "momentum" do
  version "0.4.0"
  sha256 "878df46fa463392adf446cd8fc708cc7a744fed168d914328c11a09f4f1b76e8"

  url "https://github.com/dan-hart/momentum/releases/download/v#{version}/Momentum-v#{version}-macos.zip"
  name "Momentum"
  desc "Plan your day: native task planner that syncs with Super Productivity"
  homepage "https://github.com/dan-hart/momentum"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app bundles the same `mo` the momentum-cli formula installs; install one or the
  # other (a cask cannot declare a conflict with a formula).
  # A bare version means "this or newer" (MacOSRequirement's default comparator is >=).
  depends_on macos: :tahoe

  app "Momentum.app"
  binary "#{appdir}/Momentum.app/Contents/MacOS/mo"

  zap trash: [
    "~/Library/Application Support/momentum",
    "~/Library/Preferences/com.codedbydan.Momentum.plist",
    "~/Library/Saved Application State/com.codedbydan.Momentum.savedState",
  ]

  caveats <<~EOS
    This build is signed ad hoc, not notarized by Apple. macOS will refuse to open it
    unless you install with --no-quarantine or allow it under System Settings > Privacy & Security.
  EOS
end
