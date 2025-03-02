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
alias envs='
env_chosen=$(conda info --envs | grep -v "#" | fzf)
if [ ! -z $env_chosen ]; then
  echo "Activating ${env_chosen/[[:space:]]*/}"
  conda activate ${env_chosen/[[:space:]]*/}
fi
'

# for didonato organoid project. Check if mounted, mount it and cd into the directory
alias humangen='
$(
    if [ ! -e /Volumes/Humangenetik ]; then
        open -g "smb://sreenivasan@storage.humangenetik.uni-luebeck.de/Humangenetik"
        sleep 4
    fi
) &&
cd /Volumes/Humangenetik
'
# Add tmux alias
alias tls="tmux ls"
alias tnew="tmux new -s"
alias ta='
if [[ -z $TMUX ]]; then
  tmux attach -t $(tmux ls -F #S | fzf)
else
  tmux switch -t $(tmux ls -F #S | fzf)
fi
'

# Alias for ivanti:
alias ivanti="sudo launchctl load -w /Library/LaunchDaemons/net.pulsesecure.AccessService.plist"
#
# Add starship for prompt
eval "$(starship init zsh)"

# Add yazi shortcut
# This allows starting yazi with y and cd-ing with q
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Zoxide - the better cd
eval "$(zoxide init --cmd cd zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# This is for Java
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
