class GithubSwitcher < Formula
  include Language::Python::Virtualenv

  desc "Professional CLI tool for managing multiple GitHub identities"
  homepage "https://github.com/mostafagamil/Github-Switcher"
  url "https://files.pythonhosted.org/packages/fd/9f/cb59f184698adccf580283486e4453ed2cf169b89e184c955889b3b33336/github_switcher-0.1.0-py3-none-any.whl"
  sha256 "f0720c168021116bdae5f55f35e3ac18645845f2cd6d11bdbf1bfd75ee4760ce"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create virtual environment with pip
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec
    
    # Install the wheel directly to avoid build system issues
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", cached_download
    
    # Create wrapper script
    (bin/"ghsw").write_env_script libexec/"bin/ghsw", PATH: "#{libexec}/bin:$PATH"
  end

  test do
    assert_match "GitHub Switcher", shell_output("#{bin}/ghsw --help")
  end
end