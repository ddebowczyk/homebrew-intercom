class Intercom < Formula
  desc "Coordination bus for agents working on one goal"
  homepage "https://github.com/ddebowczyk/homebrew-intercom"
  url "https://github.com/ddebowczyk/homebrew-intercom/releases/download/v1.0.0/intercom-1.0.0.tgz"
  sha256 "84e4ce46e59a187c13acf5d93f0e3e385047b98f150d766698a6946d46328ecf"
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
