class GithubSwitcher < Formula
  include Language::Python::Virtualenv

  desc "Professional CLI tool for managing multiple GitHub identities"
  homepage "https://github.com/mostafagamil/Github-Switcher"
  url "https://files.pythonhosted.org/packages/bd/76/3aa4dbf40d3091c2e6aa948be8915e2dc712aa0f2c9a5b2a7cdaf0a9a2d0/github_switcher-0.2.0-py3-none-any.whl"
  sha256 "36a746aeb277cc0a56fb884879a184814081bd07d2c4e6c673a710fd0325addf"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create virtual environment with pip
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
    
    # Install the wheel directly to avoid build system issues
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", "github-switcher==0.2.0"
    
    # Create wrapper script
    (bin/"ghsw").write_env_script libexec/"bin/ghsw", PATH: "#{libexec}/bin:$PATH"
  end

  test do
    assert_match "GitHub Switcher", shell_output("#{bin}/ghsw --help")
  end
end