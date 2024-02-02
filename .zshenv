. "$HOME/.cargo/env"

# Set up language settings
export LANG="en_US.UTF-8"


# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"

# This is for the FZF fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd'

# include several CDPATHs
export CDPATH=".:/Users/sreenivasan/.config:/Users/sreenivasan/Documents/Works:/Users/sreenivasan/Documents/Works/scripts"

# export XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config/"
