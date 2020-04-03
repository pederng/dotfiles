# Lines configured by zsh-newuser-install
HISTFILE=$XDG_DATA_HOME/zsh/histfile
HISTSIZE=100000
SAVEHIST=10000
setopt incappendhistory autocd extendedglob
unsetopt beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
setopt prompt_subst

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "$ZDOTDIR/.zshrc"


fpath=($ZDOTDIR/completions $fpath)
fpath=($ZDOTDIR/zfunc $fpath)
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

autoload -U bashcompinit
bashcompinit
# End of lines added by compinstall

setopt NO_HUP

# Disable c-s hanging of terminal
stty -ixon

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

zshrc=$ZDOTDIR/.zshrc
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
        zsh)         vim $zshrc && source $zshrc ;;
        zsh-local)   vim $ZDOTDIR/machine_specific && source $zshrc ;;
        aliases)     vim $ZDOTDIR/aliases && source $zshrc ;;
        functions)   vim $ZDOTDIR/functions && source $zshrc ;;
        xmonad)      vim ~/.xmonad/xmonad.hs && xmonad --recompile && xmonad --restart ;;
        git)         vim ~/.gitconfig ;;
        alacritty)   vim ~/.config/alacritty/alacritty.yml ;;
        qutebrowser) vim ~/.config/qutebrowser/config.py ;;
        ssh)         vim ~/.ssh/config ;;
        emacs)       vim ~/.emacs.d/init.el ;;
        starship)    vim ~/.config/starship.toml ;;
        xresources)  vim $XDG_CONFIG_HOME/X11/xresources && xrdb -merge $XDG_CONFIG_HOME/X11/xresources;;
        *)           echo "Unknown application: $1" ;;
    esac
}

function _complete_conf {
  reply=('functions' 'aliases' 'zsh' 'zsh-local' 'vim' 'vim-local' 'emacs' 'mutt' 'xmonad' 'alacritty' 'qutebrowser' 'tmux' 'ssh' 'starship' 'xresources')
}
compctl -K _complete_conf conf


# Python virtualenv
export WORKON_HOME=$XDG_DATA_HOME/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source ~/.local/bin/virtualenvwrapper.sh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export BASE16_SHELL_HOOKS=$XDG_CONFIG_HOME/base16-hooks

# export python lib path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib


#Syntax highlighting
if [ ! -f $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZDOTDIR/zsh-syntax-highlighting
fi
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--multi"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bindkey '^I' $fzf_default_completion

# Vim mode improvements
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode


function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

source $ZDOTDIR/plugins/z.sh
alias j=z

# Notes
export NOTES_DIR=$XDG_DATA_HOME/notes
export ZETTEL_DIR=$NOTES_DIR/zettelkasten

# pipenv completion
command -v pipenv >/dev/null && eval "$(pipenv --completion)"

# Stack completion
command -v stack >/dev/null && eval "$(stack --bash-completion-script stack)"

eval "$(journal completion)"
eval "$(zettel completion)"


export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)


#----Aliases-----
source $ZDOTDIR/aliases

#----Functions----
source $ZDOTDIR/functions

#----Machine-specific----
source $ZDOTDIR/machine_specific
