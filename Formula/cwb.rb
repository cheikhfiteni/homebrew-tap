# This file is kept here as a reference. The canonical copy that Homebrew
# reads lives in the cheikhfiteni/homebrew-tap repo at Formula/cwb.rb.
# Copy it there (with url + sha256 updated) when cutting a release.
class Cwb < Formula
  desc "High-level wrapper around coding-agent CLIs using isolated git worktrees"
  homepage "https://github.com/cheikhfiteni/cwb"
  url "https://github.com/cheikhfiteni/cwb/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "92caceb47cfa1d1771959ea67ef7d34c8a9ec5c21bd0d1f35853f241b441706b"
  license "MIT"

  head "https://github.com/cheikhfiteni/cwb.git", branch: "main"

  def install
    prefix.install "cwb", "lib"
  end

  def caveats
    <<~EOS
      Add the following to your shell profile (~/.zshrc or ~/.bashrc):

        source "#{opt_prefix}/cwb"

      Then reload your shell:

        source ~/.zshrc
    EOS
  end

  test do
    output = shell_output("bash -c 'source #{opt_prefix}/cwb && cwb --version'")
    assert_match "cwb", output
  end
end
