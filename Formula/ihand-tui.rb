class IhandTui < Formula
  desc "AI Chat in Your Terminal — Full-screen TUI with multi-LLM support, file ops, and exec"
  homepage "https://github.com/bachtiarpanjaitan/ihand-tui"
  url "https://github.com/bachtiarpanjaitan/ihand-tui/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "dbbf1ce63ad472e06a2a42b0f5c4f60bb9cb87608655b5b915543fd53945be1d"
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
