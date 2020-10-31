# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/master/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20201031-154415-9614e117/WezTerm-macos-20201031-154415-9614e117.zip"
  sha256 "cb0482594a4306bc768c14d66f85287c2d9afb91687b27a2e4784f50e65d0672"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm-gui"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm-mux-server"
    bin.write_exec_script "#{prefix}/WezTerm.app/strip-ansi-escapes"
  end
end

