# Redirect vim and vi commands to neovim
alias e="nvim"
alias vi="nvim"
alias vf='nvim "${HOME}/Documents/$(cd ${HOME}/Documents && fzf)"'

# Automatically colorise ls output
alias ls="ls --color=auto"

# Set bat color
alias bat="bat --theme=Nord"

# Add alias to cd with fzf
export FZF_ALT_C_OPTS="--walker=dir,follow --walker-root ${HOME}/Documents --height=~100% --preview-window down --preview 'tree -L 2 -C {} | head -200'"

# Add alias to conda activate
alias envs='conda activate $(conda info --envs | fzf | sed "s/\s*\/.*//")'

# for didonato organoid project. Check if mounted, mount it and cd into the directory
alias didonato='
$(
    if [ ! -e /Volumes/Humangenetik/General/Projects/Projects_2024/P050_2024_10x_DiDonato_Niehaus ]; then
        open -g "smb://sreenivasan@storage.humangenetik.uni-luebeck.de/Humangenetik"
        sleep 4
    fi
) &&
cd /Volumes/Humangenetik/General/Projects/Projects_2024/P050_2024_10x_DiDonato_Niehaus
'

#
# Add starship for prompt
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# This is for Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
