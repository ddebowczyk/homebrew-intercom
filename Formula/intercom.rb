class Intercom < Formula
  desc "Coordination bus for agents working on one goal"
  homepage "https://github.com/ddebowczyk/homebrew-intercom"
  url "https://github.com/ddebowczyk/homebrew-intercom/releases/download/v2.1.0/intercom-2.1.0.tgz"
  sha256 "077a44ea9edc4a2e6523a1025699862d00a484f7efe9833b63838dfd339517e9"
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
