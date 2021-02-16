# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/master/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20210203-095643-70a364eb/WezTerm-macos-20210203-095643-70a364eb.zip"
  sha256 "b981e356bc7323e23b5f6b767b10fd530737878529aa70c26252438abb1bfc24"
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  def install
    prefix.install "WezTerm.app"
    bindir = "#{prefix}/WezTerm.app"
    macosdir = "#{bindir}/Contents/MacOS"
    if File.directory?(macosdir) then
      bindir = macosdir
    end
    ["wezterm", "wezterm-gui", "wezterm-mux-server", "strip-ansi-escapes"].each { |tool|
      bin.write_exec_script "#{bindir}/#{tool}"
    }
  end
end
