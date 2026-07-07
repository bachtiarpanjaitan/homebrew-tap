class IhandTui < Formula
  desc "AI Chat in Your Terminal — Full-screen TUI with multi-LLM support, file ops, and exec"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "ebbed6000ff045251f99d8d9ae7cb80d56c8c7e016c025aa166e5570579558b8"
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
