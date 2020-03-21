# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=10000
setopt incappendhistory autocd extendedglob
unsetopt beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
setopt prompt_subst

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/peder/.zshrc'


fpath=(~/.zsh/completions $fpath)
fpath=(~/.zfunc $fpath)
autoload -Uz compinit
compinit

autoload -U bashcompinit
bashcompinit
# End of lines added by compinstall

setopt NO_HUP

# Disable c-s hanging of terminal
stty -ixon

# Path
export GOPATH=~/workspace/go
path=($path $GOPATH/bin)


# Tab completion for cd ..

zstyle ':completion:*' special-dirs true

# Bindings

bindkey '^p' up-history
bindkey '^n' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^d' delete-char
bindkey '^[d' delete-word
bindkey '^k' kill-line
bindkey '^j' accept-line
bindkey '^y' yank
bindkey '^l' clear-screen
bindkey '^w' backward-kill-word
bindkey '^b' backward-char
bindkey '^[b' backward-word
bindkey '^f' forward-char
bindkey '^[f' forward-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

#Prompt
eval "$(starship init zsh)"

# Visual mode fixes
export KEYTIMEOUT=1

#Configurations
conf() {
    case $1 in
        pacman)      svim /etc/pacman.conf ;;
        tmux)        vim ~/.tmux.conf ;;
        mutt)        vim ~/.muttrc ;;
        vim)         vim ~/.vim/vimrc ;;
        vim-local)   vim ~/.vim/machine_specific_vimrc ;;
        xinit)       vim ~/.xinitrc ;;
        zathura)     vim ~/.config/zathura/zathurarc ;;
        zsh)         vim ~/.zshrc && source ~/.zshrc ;;
        zsh-local)   vim ~/.zsh/machine_specific && source ~/.zshrc ;;
        aliases)     vim ~/.zsh/aliases && source ~/.zshrc ;;
        functions)   vim ~/.zsh/functions && source ~/.zshrc ;;
        xmonad)      vim ~/.xmonad/xmonad.hs && xmonad --recompile && xmonad --restart ;;
        git)         vim ~/.gitconfig ;;
        alacritty)   vim ~/.config/alacritty/alacritty.yml ;;
        qutebrowser) vim ~/.config/qutebrowser/config.py ;;
        ssh)         vim ~/.ssh/config ;;
        emacs)       vim ~/.emacs.d/init.el ;;
        starship)    vim ~/.config/starship.toml ;;
        *)           echo "Unknown application: $1" ;;
    esac
}

function _complete_conf {
  reply=('functions' 'aliases' 'zsh' 'zsh-local' 'vim' 'vim-local' 'emacs' 'mutt' 'xmonad' 'alacritty' 'qutebrowser' 'tmux' 'ssh' 'starship')
}
compctl -K _complete_conf conf

# Export default programs
export EDITOR="vim"
export BROWSER="qutebrowser"

# XDG
export XDG_CONFIG_HOME=$HOME/.config

# Python virtualenv
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source ~/.local/bin/virtualenvwrapper.sh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# export python lib path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib


#Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--multi"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey '^I' $fzf_default_completion

# Vim mode improvements
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode


# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

source ~/.zsh/plugins/z.sh
alias j=z

# pipenv completion
eval "$(pipenv --completion)"

# Stack completion
eval "$(stack --bash-completion-script stack)"

eval "$(notes completion)"
eval "$(journal completion)"
eval "$(zettel completion)"


export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Notes
export NOTES_DIR=$HOME/.notes
export ZETTEL_DIR=$NOTES_DIR/zettel

#----Aliases-----
source ~/.zsh/aliases

#----Functions----
source ~/.zsh/functions

#----Machine-specific----
source ~/.zsh/machine_specific
