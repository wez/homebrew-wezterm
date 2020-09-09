# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/master/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20200909-002054-4c9af461/WezTerm-macos-20200909-002054-4c9af461.zip"
  sha256 "0f2f1a7814672b006cc0368111eb76571502edc5678c4c1d05508e5a11ab669e"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm"
    bin.write_exec_script "#{prefix}/WezTerm.app/strip-ansi-escapes"
  end
end

