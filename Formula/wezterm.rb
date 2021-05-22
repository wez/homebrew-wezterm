# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/main/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.

class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  version "20210522-migration-notice"
  url "https://github.com/wez/wezterm/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  sha256 :no_check
  head "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"

  disable! date: "2021-05-22", because: <<~EOS
    is migrated from
    current Formula to Casks 'wezterm' and 'wezterm-nightly'. With the new Casks,
    the WezTerm.app will be put into /Applications/ automatically.

    You should migrate to the new Cask right now.
    If you have formula 'wezterm' installed, uninstall it first,
      brew uninstall --formula wezterm
      rm -rf /Applications/WezTerm.app
    Then install WezTerm from the new cask 'wezterm',
      brew install --cask wezterm --no-quarantine
    or 'wezterm-nightly' for nightly build,
      brew install --cask wezterm-nightly --no-quarantine

    This formula may remain in the repo for a while to notice users migrate to the cask,
    which results a name conflict between the formula 'wezterm' and the cask 'wezterm'.
    Please pass '--cask' explicitly when doing 'wezterm' related 'brew' command, e.g.
      brew upgrade --cask wezterm --no-quarantine

    Sorry about the trouble for you guys
  EOS

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

