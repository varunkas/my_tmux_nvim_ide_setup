# Dotfiles

These are my dotfiles to set up the following:

- TMUX
- Neovim
- Alacritty
- Iterm2 (ditched in favour of Alacritty)
- Starship
- Conda
- Zsh

Note, throughout catppuccin-mocha is used as the theme.

Copy the repo into the ~ directory and should be good to go :)

## Dependencies

1. Install [TPM](https://github.com/tmux-plugins/tpm), the TMUX plugin manager.
2. Install nerd fonts: Hack and MesloLGM are good options

## Notes about certain configurations

1. Most of the Neovim configuration is based on YouTube Video by Typecraft and kickstart.nvim repo.
2. The configuration is super modular and has the following main plugins:
    - Telescope
    - vim-tmux-navigator
    - LSP (based on Mason)
    - Treesitter
    - None-ls for Linting and Formatting
