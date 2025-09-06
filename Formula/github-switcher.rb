class GithubSwitcher < Formula
  include Language::Python::Virtualenv

  desc "Professional CLI tool for managing multiple GitHub identities"
  homepage "https://github.com/mostafagamil/Github-Switcher"
  version "0.1.0"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python@3.11")
    
    # Install directly from PyPI to avoid uv_build backend issues
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "github-switcher==#{version}"
    
    # Create wrapper script
    (bin/"ghsw").write_env_script libexec/"bin/ghsw", PATH: "#{libexec}/bin:$PATH"
  end

  test do
    assert_match "GitHub Switcher", shell_output("#{bin}/ghsw --help")
  end
end