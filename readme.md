# Readme

This repo contains my IDE setup configured using tmux and neovim.

## TMUX configuration
1. Install TPM, the TMUX plugin manager: https://github.com/tmux-plugins/tpm
2. Make sure nerd fonts is installed
3. Copy tmux/.tmux.conf file to ~/ 
4. Start tmux

## NEOVIM configuration
1. Most of the NEOVIM configuration is based on YouTube Video by Typecraft and kickstart.nvim repo.
2. Copy the  nvim directory into ~/.config/
3. (Re)start nvim and you should be good to go.
4. The configuration is super modular and has the following main plugins:
    - Telescope
    - vim-tmux-navigator
    - LSP (based on Mason)
    - Treesitter

## Iterm2 configuration
1. Added catppuccin-mocha colorscheme file. Import it to iterm2
