class GithubSwitcher < Formula
  include Language::Python::Virtualenv

  desc "Professional CLI tool for managing multiple GitHub identities"
  homepage "https://github.com/mostafagamil/Github-Switcher"
  url "https://files.pythonhosted.org/packages/source/g/github-switcher/github_switcher-0.1.0.tar.gz"
  sha256 "aa17195aec9470e30f2f2666d0ad7ae685bebe710606a9af09404fa99f764cd6"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "-v", "github-switcher==#{version}"
    
    # Create wrapper script
    (bin/"ghsw").write_env_script libexec/"bin/ghsw", PATH: "#{libexec}/bin:$PATH"
  end

  test do
    assert_match "GitHub Switcher", shell_output("#{bin}/ghsw --help")
  end
end