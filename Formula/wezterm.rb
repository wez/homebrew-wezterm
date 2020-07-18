# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/master/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20200718-095447-d2315640/WezTerm-macos-20200718-095447-d2315640.zip"
  sha256 "a6db96329c5b066da68c189ab0e2229796ab5747e520e03b1cfd4bcca30d7773"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm"
    bin.write_exec_script "#{prefix}/WezTerm.app/strip-ansi-escapes"
  end
end

