class IhandTui < Formula
  desc "AI Chat in Your Terminal — Full-screen TUI with multi-LLM support"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "52bd2c5f33ac24e54564d9e12b8780551d956a2941afdef4bccaa241f3a62ea7"
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
