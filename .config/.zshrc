#Prompt string
PS1="$ "
#PS1="%n@%m: "

# Redirect vim and vi commands to neovim
alias vim="nvim"
alias vi="nvim"
alias vf='nvim $(fzf)'

# Automatically colorise ls output
alias ls="ls --color=auto"

# Add alias to cd
alias cf='cd "$(fzf)"'

# Add alias to cd
alias envs='conda activate $(conda info --envs | fzf | sed "s/\s*\/.*//")'

# Add starship for prompt
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# This is for Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
