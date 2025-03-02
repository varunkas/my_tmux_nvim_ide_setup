. "$HOME/.cargo/env"

# Set up language settings
export LANG="en_US.UTF-8"

# use neovim for man pages
export MANPAGER='nvim +Man!'

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"

# Add path to Tex installation
export PATH="/usr/local/texlive/2023/bin/universal-darwin:${PATH}"

# This is for the FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd'

# include several CDPATHs
# export CDPATH=".:/Users/sreenivasan/Documents/Works/scripts"

# Change default editor
# export EDITOR=nvim

# export XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config/"
