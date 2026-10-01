class Fav < Formula
  desc "Speed-dial for files and folders"
  homepage "https://github.com/dan-hart/fav"
  url "https://github.com/dan-hart/fav/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b2e9bff59db13ba1412920070188eb85ead6b4ef3150aebbbee40564395177a6"
  license "GPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "fav #{version}", shell_output("#{bin}/fav --version")
    ENV["FAV_CONFIG"] = (testpath/"favorites.json").to_s
    target = testpath/"example directory"
    target.mkpath
    assert_match '"ok":true', shell_output("#{bin}/fav ensure #{target.to_s.shellescape} --alias example --json")
    assert_equal target.realpath.to_s, shell_output("#{bin}/fav resolve example").strip
    original = (testpath/"favorites.json").read
    assert_match '"dry_run":true', shell_output("#{bin}/fav meta example --note preview --dry-run --json")
    assert_equal original, (testpath/"favorites.json").read
  end
end
