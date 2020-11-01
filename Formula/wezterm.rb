# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/master/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20201101-103216-403d002d/WezTerm-macos-20201101-103216-403d002d.zip"
  sha256 "1b5312144cd81b1dc8d100101cfe2c404e80d2fefa21bbc2540d7b58450347a6"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm-gui"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm-mux-server"
    bin.write_exec_script "#{prefix}/WezTerm.app/strip-ansi-escapes"
  end
end

