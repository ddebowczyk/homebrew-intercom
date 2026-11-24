class Intercom < Formula
  desc "Coordination bus for agents working on one goal"
  homepage "https://github.com/ddebowczyk/homebrew-intercom"
  url "https://github.com/ddebowczyk/homebrew-intercom/releases/download/v2.2.0/intercom-2.2.0.tgz"
  sha256 "cd5549151345282ee9aa67b6b0c7324e683cb8e1c3f813ae99732183f67e317e"
  license "MIT"

  depends_on "node"

  # The release asset is an `npm pack` tarball, so the build directory is a
  # package root. `std_npm_args` installs it into libexec with its runtime
  # dependencies and leaves the declared bin scripts under libexec/bin.
  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "intercom",
                 shell_output("#{bin}/intercom help")
  end
end
