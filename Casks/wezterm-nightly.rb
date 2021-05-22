cask "wezterm-nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/wez/wezterm/releases/download/nightly/WezTerm-macos-nightly.zip"
  name "WezTerm"
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"

  conflicts_with cask: "wez/wezterm/wezterm"

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
    "~/.config/wezterm",
    "~/Library/Saved Application State/com.github.wez.wezterm.savedState",
  ]

  def caveats; <<~EOS
    Cask #{token} related executables like 'wezterm', 'wezterm-gui',
    'wezterm-mux-server', are linked into
      /usr/local/bin/    for x86 Mac,
      /opt/homebrew/bin/ for M1 Mac.

    Removal of them is ensured by 'brew uninstall --cask #{token}'.

    Since there's no version info included in the download URL of the nightly
    build, NO update will be notified for 'wezterm-nightly' by Homebrew. (Not a
    problem for non-nightly, regular released 'wezterm'.) To get the nightly
    update, just run 'brew upgrade --cask wezterm-nightly'.
  EOS
  end
end
