# 🚀 Development Environment Setup Script

An automated bash script to set up a complete, aesthetically pleasing development environment with Fish shell, TMUX, Neovim, and Oh My Posh, all configured with the beautiful Dracula color scheme.

## 🎯 What This Script Does

This script automates the installation and configuration of a modern development environment that includes:

- **🐟 Fish Shell** - A smart and user-friendly command line shell
- **🖥️ TMUX** - Terminal multiplexer for managing multiple sessions
- **✏️ Neovim** - Modern, extensible text editor with plugins
- **✨ Oh My Posh** - Customizable prompt engine with git integration
- **🎨 Dracula Theme** - Beautiful dark theme applied across all tools
- **🔤 JetBrains Mono Nerd Font** - Programming font with icons and ligatures

## 🔧 Features

### Fish Shell Configuration
- Custom aliases for common commands
- Git shortcuts (`gs`, `ga`, `gc`, `gp`, etc.)
- TMUX integration aliases
- Custom functions for directory creation and file extraction
- Oh My Posh integration with Dracula theme

### TMUX Configuration
- Ctrl-a prefix (instead of Ctrl-b)
- Mouse support enabled
- Vim-like pane navigation
- Dracula theme with system monitoring
- Plugin manager (TPM) integration
- Smart window/pane management

### Neovim Configuration
- Essential plugins via vim-plug
- Dracula colorscheme
- File explorer (NERDTree)
- Fuzzy finder (CtrlP)
- Git integration (Fugitive)
- Status line (Airline)
- Auto-pairs and syntax highlighting

### Oh My Posh Features
- Git status display
- Execution time tracking
- Node.js and Python version display
- Time display
- Error status indication
- Beautiful Dracula-themed prompt

## 🚀 Quick Start

1. **Clone the repository and run the script:**
   ```bash
   git clone https://github.com/maxrenke/dev-environment-setup.git
   cd dev-environment-setup
   chmod +x setup_dev_environment.sh
   ./setup_dev_environment.sh
   ```

2. **Set Fish as default shell:**
   ```bash
   chsh -s $(which fish)
   ```

3. **Install TMUX plugins:**
   - Start TMUX: `tmux`
   - Press `Ctrl-a + I` to install plugins

4. **Configure your terminal:**
   - Set font to "JetBrainsMono Nerd Font"
   - Restart your terminal

## 📋 Prerequisites

- **Operating System:** Ubuntu/Debian-based Linux distribution
- **Requirements:** sudo privileges for package installation
- **Internet Connection:** Required for downloading packages and fonts

## 🎨 Why This Setup?

### The Problem
Setting up a development environment from scratch is time-consuming and error-prone. Developers often spend hours configuring their terminal, editor, and shell to be productive and visually appealing.

### The Solution
This script was created to:
- **Save Time**: Automate the entire setup process
- **Ensure Consistency**: Same configuration across different machines
- **Provide Best Practices**: Curated tools and configurations
- **Look Professional**: Cohesive Dracula theme across all tools
- **Boost Productivity**: Pre-configured shortcuts and workflows

### Why These Tools?
- **Fish Shell**: Superior autocompletion and syntax highlighting
- **TMUX**: Essential for remote development and session management
- **Neovim**: Modern, fast, and extensible editor
- **Oh My Posh**: Cross-platform prompt with rich git integration
- **Dracula Theme**: Easy on the eyes and professionally designed

## 💡 Improvement Suggestions

### 🔄 Immediate Enhancements
- [ ] Add support for more Linux distributions (CentOS, Fedora, Arch)
- [ ] Include error handling and rollback functionality
- [ ] Add option to skip certain components
- [ ] Create backup of existing configurations
- [ ] Add progress indicators and better logging

### 🚀 Advanced Features
- [ ] **Language Support**: Add language-specific tools (Node.js, Python, Go, Rust)
- [ ] **Docker Integration**: Include Docker and Docker Compose setup
- [ ] **Cloud Tools**: Add AWS CLI, kubectl, terraform
- [ ] **Security Tools**: Include GPG, SSH key generation
- [ ] **Database Tools**: Add database clients (psql, mysql, redis-cli)

### 🎯 Customization Options
- [ ] **Theme Selection**: Allow choosing between different color schemes
- [ ] **Modular Installation**: Component-based installation options
- [ ] **Configuration Templates**: Multiple preset configurations
- [ ] **Personal Dotfiles**: Integration with existing dotfiles repositories

### 🔧 Technical Improvements
- [ ] **Package Manager Detection**: Auto-detect and use appropriate package manager
- [ ] **Version Management**: Support for specific tool versions
- [ ] **Dependency Checking**: Verify prerequisites before installation
- [ ] **Update Script**: Mechanism to update configurations
- [ ] **Testing**: Add automated tests for different environments

### 🌐 Cross-Platform Support
- [ ] **macOS Support**: Homebrew-based installation
- [ ] **Windows Support**: WSL2 and PowerShell versions
- [ ] **ARM Support**: Apple Silicon and ARM Linux compatibility

## 📁 Configuration Files Created

After running the script, you'll have:

```
~/.config/fish/config.fish          # Fish shell configuration
~/.config/ohmyposh/dracula.omp.json # Oh My Posh theme
~/.tmux.conf                        # TMUX configuration
~/.config/nvim/init.vim             # Neovim configuration
~/.local/share/fonts/               # JetBrains Mono Nerd Font
```

## 🎯 Usage Tips

### Fish Shell
- Type any command and press Tab for autocompletion
- Use `mkcd dirname` to create and enter a directory
- Use `extract filename` to extract any archive format

### TMUX
- `Ctrl-a + |` - Split window horizontally
- `Ctrl-a + -` - Split window vertically
- `Ctrl-a + h/j/k/l` - Navigate panes
- `Ctrl-a + I` - Install plugins

### Neovim
- `Space + w` - Save file
- `Space + q` - Quit
- `Ctrl-n` - Toggle file explorer
- `Space + tn` - New tab

## 🤝 Contributing

Contributions are welcome! Please feel free to:
- Report bugs
- Suggest improvements
- Submit pull requests
- Share your customizations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Dracula Theme](https://draculatheme.com/) - Beautiful color scheme
- [Oh My Posh](https://ohmyposh.dev/) - Amazing prompt engine
- [Fish Shell](https://fishshell.com/) - Fantastic shell experience
- [TMUX](https://github.com/tmux/tmux) - Essential terminal multiplexer
- [Neovim](https://neovim.io/) - Modern text editor

---

**Made with ❤️ for developers who love beautiful, functional terminals**
