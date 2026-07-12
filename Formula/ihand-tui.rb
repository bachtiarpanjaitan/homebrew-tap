class IhandTui < Formula
  desc "AI chat in your terminal with multi-LLM support, file ops, and exec"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "ec4e968152c16a3e7d808beab083ce906ea4fd58e6111b346f79640f2e7d7077"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-o", bin/"ihand", "-ldflags=#{ldflags}", "."
  end

  test do
    assert_match "ihand version #{version}", shell_output("#{bin}/ihand --version")
  end
end
