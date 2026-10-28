# Dan Hart's Homebrew tap

## emask

Create masked email addresses with Fastmail or DuckDuckGo:

```bash
brew install dan-hart/tap/emask
emask setup
emask
```

The formula installs the published binary for Apple Silicon Macs, Intel Macs,
or Linux x86_64, plus Bash, Zsh, and Fish completions. No Rust toolchain is needed.

To upgrade:

```bash
brew update
brew upgrade dan-hart/tap/emask
emask --version
```

See the [emask Homebrew guide](https://github.com/dan-hart/emask/blob/main/docs/homebrew.md)
for installation paths, moving from Cargo, and publishing formula updates.
Credentials are configured in a terminal with `emask setup` and stay in emask's
private configuration when Homebrew upgrades the package.

The app's [README](https://github.com/dan-hart/emask#readme) covers everyday usage,
and the [Shortcuts guide](https://github.com/dan-hart/emask/blob/main/docs/shortcuts.md)
covers automation on macOS.

## Other packages

See [Formula](Formula) for command-line tools and [Casks](Casks) for apps.
