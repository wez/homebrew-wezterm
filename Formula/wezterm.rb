class Wezterm < Formula
  desc "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
  homepage "https://wezfurlong.org/wezterm/"
  url "https://github.com/wez/wezterm/releases/download/20200517-122836-92c201c6/WezTerm-macos-20200517-122836-92c201c6.zip"
  sha256 "afd3d83d35b0c9b1b476d36810ab1c0098f562e0edc52bc3da2be98b4cf1976f"

  def install
    prefix.install "WezTerm.app"
    bin.write_exec_script "#{prefix}/WezTerm.app/wezterm"
  end
end
