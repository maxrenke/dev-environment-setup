#!/bin/bash

# Development Environment Setup Script
# Installs and configures Fish shell, TMUX, Neovim with Dracula theme, and Oh My Posh

set -e  # Exit on any error

echo "🚀 Setting up development environment..."
echo "This script will install and configure:"
echo "  - Fish shell"
echo "  - TMUX multiplexer"
echo "  - Neovim editor"
echo "  - Oh My Posh prompt"
echo "  - Dracula color scheme"
echo ""

# Update package manager
echo "📦 Updating package manager..."
sudo apt update

# Install required packages
echo "🔧 Installing Fish, TMUX, Neovim, and dependencies..."
sudo apt install -y fish tmux neovim curl git unzip fontconfig

# Create necessary directories
echo "📁 Creating configuration directories..."
mkdir -p ~/.config/fish
mkdir -p ~/.config/nvim
mkdir -p ~/.tmux/plugins
mkdir -p ~/.local/bin

# Install Oh My Posh
echo "✨ Installing Oh My Posh..."
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

# Download a Nerd Font for Oh My Posh
echo "🔤 Installing Nerd Font..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "JetBrainsMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd ~

# Configure Fish shell with Oh My Posh
echo "🐟 Configuring Fish shell with Oh My Posh..."
cat > ~/.config/fish/config.fish << 'EOF'
# Fish shell configuration with Oh My Posh

# Set environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PATH ~/.local/bin $PATH

# Initialize Oh My Posh
oh-my-posh init fish --config ~/.config/ohmyposh/dracula.omp.json | source

# Aliases
alias ll='ls -la'
alias la='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias vim='nvim'
alias vi='nvim'

# TMUX aliases
alias tm='tmux'
alias tma='tmux attach'
alias tmn='tmux new-session'
alias tml='tmux list-sessions'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline'
alias gd='git diff'

# Custom functions
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via extract()"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end
EOF

# Create Oh My Posh configuration directory and theme
echo "🎨 Setting up Oh My Posh Dracula theme..."
mkdir -p ~/.config/ohmyposh
cat > ~/.config/ohmyposh/dracula.omp.json << 'EOF'
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "background": "#bd93f9",
          "foreground": "#282a36",
          "leading_diamond": "\ue0b6",
          "properties": {
            "style": "folder"
          },
          "style": "diamond",
          "template": " \uf74a {{ .Path }} ",
          "trailing_diamond": "\ue0b0",
          "type": "path"
        },
        {
          "background": "#ffb86c",
          "foreground": "#282a36",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "branch_icon": "\ue725 ",
            "fetch_status": true,
            "fetch_upstream_icon": true
          },
          "style": "powerline",
          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \uf692 {{ .StashCount }}{{ end }} ",
          "type": "git"
        },
        {
          "background": "#8be9fd",
          "foreground": "#282a36",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "fetch_version": true
          },
          "style": "powerline",
          "template": " \ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }} ",
          "type": "node"
        },
        {
          "background": "#ff79c6",
          "foreground": "#282a36",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "fetch_version": true
          },
          "style": "powerline",
          "template": " \ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} ",
          "type": "python"
        },
        {
          "background": "#50fa7b",
          "foreground": "#282a36",
          "powerline_symbol": "\ue0b0",
          "properties": {
            "threshold": 500
          },
          "style": "powerline",
          "template": " \uf252 {{ .FormattedMs }} ",
          "type": "executiontime"
        },
        {
          "background": "#f1fa8c",
          "background_templates": [
            "{{ if gt .Code 0 }}#ff5555{{ end }}"
          ],
          "foreground": "#282a36",
          "leading_diamond": "<transparent,background>\ue0b0</>",
          "properties": {
            "always_enabled": true
          },
          "style": "diamond",
          "template": " {{ if gt .Code 0 }}\uf00d {{ .Meaning }}{{ else }}\uf42e{{ end }} ",
          "trailing_diamond": "\ue0b4",
          "type": "status"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "right",
      "segments": [
        {
          "background": "#44475a",
          "foreground": "#f8f8f2",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": " \uf017 {{ .CurrentDate | date .Format }} ",
          "trailing_diamond": "\ue0b4",
          "type": "time"
        }
      ],
      "type": "prompt"
    }
  ],
  "console_title_template": "{{ .Shell }} in {{ .Folder }}",
  "final_space": true,
  "version": 2
}
EOF

# Configure TMUX
echo "🖥️  Configuring TMUX..."
cat > ~/.tmux.conf << 'EOF'
# TMUX Configuration with Dracula theme

# Set prefix to Ctrl-a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Enable mouse support
set -g mouse on

# Set default terminal
set -g default-terminal "screen-256color"
set -ga terminal-overrides ",*256col*:Tc"

# Start windows and panes at 1, not 0
set -g base-index 1
setw -g pane-base-index 1

# Reload config file
bind r source-file ~/.tmux.conf \; display "Config reloaded!"

# Split panes
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Navigate panes with vim-like keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Resize panes
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# Set Fish as default shell
set -g default-shell /usr/bin/fish

# Activity monitoring
setw -g monitor-activity on
set -g visual-activity on

# Renumber windows when a window is closed
set -g renumber-windows on

# Status bar position
set -g status-position top
EOF

# Install TMUX Plugin Manager
echo "🔌 Installing TMUX Plugin Manager..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Add plugin configuration to tmux.conf
cat >> ~/.tmux.conf << 'EOF'

# Plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'dracula/tmux'

# Dracula theme customization
set -g @dracula-show-powerline true
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session
set -g @dracula-plugins "cpu-usage ram-usage time"
set -g @dracula-show-timezone false
set -g @dracula-military-time true

# Initialize TMUX plugin manager (keep this line at the very bottom)
run '~/.tmux/plugins/tpm/tpm'
EOF

# Configure Neovim
echo "✏️  Configuring Neovim..."
cat > ~/.config/nvim/init.vim << 'EOF'
" Neovim Configuration with Dracula theme

" Basic settings
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set termguicolors

" Enable syntax highlighting
syntax on

" Plugin management with vim-plug
call plug#begin('~/.vim/plugged')

" Dracula colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'tpope/vim-fugitive'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Comments
Plug 'tpope/vim-commentary'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Indentation guides
Plug 'Yggdroot/indentLine'

call plug#end()

" Set colorscheme
colorscheme dracula

" Airline theme
let g:airline_theme='dracula'
let g:airline_powerline_fonts = 1

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" IndentLine settings
let g:indentLine_color_gui = '#44475a'

" Key mappings
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>so :so ~/.config/nvim/init.vim<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Tab navigation
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>tl :tabnext<CR>

" Search improvements
nnoremap <leader>h :nohlsearch<CR>
EOF

# Install vim-plug for Neovim
echo "🔌 Installing vim-plug for Neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Neovim plugins
echo "🔧 Installing Neovim plugins..."
nvim +PlugInstall +qall

# Set Fish as default shell
echo "🐟 Setting Fish as default shell..."
if ! grep -q "$(which fish)" /etc/shells; then
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

echo ""
echo "⚠️  To set Fish as your default shell, run:"
echo "   chsh -s $(which fish)"
echo ""
echo "You may need to log out and log back in for the change to take effect."

echo ""
echo "🎉 Setup complete! Your development environment is ready with:"
echo "  ✅ Fish shell configured"
echo "  ✅ Oh My Posh with Dracula theme"
echo "  ✅ TMUX with Dracula theme"
echo "  ✅ Neovim with Dracula theme and plugins"
echo "  ✅ JetBrains Mono Nerd Font installed"
echo ""
echo "🚀 Quick start commands:"
echo "  - Start TMUX: tmux"
echo "  - Start Fish: fish"
echo "  - Open Neovim: nvim"
echo ""
echo "🎨 All components are configured with the Dracula color scheme!"
echo ""
echo "📝 Configuration files created:"
echo "  - ~/.config/fish/config.fish"
echo "  - ~/.config/ohmyposh/dracula.omp.json"
echo "  - ~/.tmux.conf"
echo "  - ~/.config/nvim/init.vim"
echo ""
echo "💡 Tips:"
echo "  - Install TMUX plugins: Press Ctrl-a + I inside TMUX"
echo "  - Make sure to set your terminal font to 'JetBrainsMono Nerd Font'"
echo "  - Oh My Posh will show git status, execution time, and more!"
