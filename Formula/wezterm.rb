# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/main/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20210314-114017-04b7cedd/WezTerm-macos-20210314-114017-04b7cedd.zip"
  sha256 "f45a51aa590382be88594db5d5767ab58da56ff12451b1fb1baabb3bf5f58b9d"
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

