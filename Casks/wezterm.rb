# Note: if you are viewing this from the tap repo, this file is automatically
# updated from:
# https://github.com/wez/wezterm/blob/main/ci/wezterm-homebrew-macos.rb.template
# by automation in the wezterm repo.
# vim:ft=ruby:
cask "wezterm" do
  version "20220101-131008-e11b9460"
  sha256 "148d47829fd72b0ae339b27b6d3413d47525968081b1a758881a6d89dec06ce7"

  url "https://github.com/wez/wezterm/releases/download/#{version}/WezTerm-macos-#{version}.zip"
  name "WezTerm"
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"

  conflicts_with cask: "wez/wezterm/wezterm-nightly"

  # Unclear what the minimal OS version is
  # depends_on macos: ">= :sierra"

  app "WezTerm.app"
  [
    "wezterm",
    "wezterm-gui",
    "wezterm-mux-server",
    "strip-ansi-escapes"
  ].each do |tool|
    binary "#{appdir}/WezTerm.app/Contents/MacOS/#{tool}"
  end

  preflight do
    # Move "WezTerm-macos-#{version}/WezTerm.app" out of the subfolder
    staged_subfolder = staged_path.glob(["WezTerm-*", "wezterm-*"]).first
    if staged_subfolder
      FileUtils.mv(staged_subfolder/"WezTerm.app", staged_path)
      FileUtils.rm_rf(staged_subfolder)
    end
  end

  zap trash: [
    "~/Library/Saved Application State/com.github.wez.wezterm.savedState",
  ]

  def caveats; <<~EOS
    Cask #{token} related executables like 'wezterm', 'wezterm-gui',
    'wezterm-mux-server', are linked into
      /usr/local/bin/    for x86 Mac,
      /opt/homebrew/bin/ for M1 Mac.

    Removal of them is ensured by 'brew uninstall --cask #{token}'.
  EOS
  end
end
