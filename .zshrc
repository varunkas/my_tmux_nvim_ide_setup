#Prompt string
PS1="$ "
#PS1="%n@%m: "

# Redirect vim and vi commands to neovim
alias vim="nvim"
alias vi="nvim"

# Automatically colorise ls output
alias ls="ls --color=auto"

# Add starship for prompt
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# This is for Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
