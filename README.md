# Homebrew Tap for GitHub Switcher

This is the official Homebrew tap for [GitHub Switcher CLI](https://github.com/mostafagamil/Github-Switcher), a professional CLI tool for managing multiple GitHub identities.

## Installation

```bash
# Add the tap
brew tap mostafagamil/github-switcher

# Install GitHub Switcher
brew install github-switcher
```

## Usage

After installation, you can use the `ghsw` command:

```bash
# Create a new profile with interactive wizard
ghsw create

# List all profiles
ghsw list

# Switch to a profile
ghsw switch <profile-name>

# Show current profile
ghsw current

# Get help
ghsw --help
```

## Alternative Installation Methods

- **PyPI**: `pip install github-switcher`
- **UV**: `uv tool install github-switcher`

## Links

- [GitHub Repository](https://github.com/mostafagamil/Github-Switcher)
- [PyPI Package](https://pypi.org/project/github-switcher/)
- [Documentation](https://github.com/mostafagamil/Github-Switcher#readme)