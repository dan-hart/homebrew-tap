# Rendered by build-aux/release.py homebrew for the dan-hart/homebrew-tap repository.
# brew install --cask dan-hart/tap/momentum
cask "momentum" do
  version "0.4.17"
  sha256 "a5332333ef4510061beda8787e84caa317c99d6de3c815809fa4ab5c149f44f0"

  url "https://github.com/dan-hart/momentum/releases/download/v#{version}/Momentum-v#{version}-macos.zip"
  name "Momentum"
  desc "Plan your day: native task planner with optional sync"
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
end
