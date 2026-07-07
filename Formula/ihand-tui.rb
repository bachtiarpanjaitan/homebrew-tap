class IhandTui < Formula
  desc "AI Chat in Your Terminal — Full-screen TUI with multi-LLM support, file ops, and exec"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "25b70ecab8a1b0a903c9841053fa3ee1834f64125035cc988016c5a24d0acaa7"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_match "ihand version #{version}", shell_output("#{bin}/ihand --version")
  end
end
