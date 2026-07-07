class IhandTui < Formula
  desc "AI Chat in Your Terminal — Full-screen TUI with multi-LLM support, file ops, and exec"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "2cd587cc4efb6ef9d898628b3fb7c777334117b46a179a7315f8c97f198f9490"
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
