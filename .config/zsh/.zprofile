# Export default programs
export EDITOR="vim"
export BROWSER="qutebrowser"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
export GOPATH=~/workspace/go
export PATH="$GOPATH/bin:$PATH"

# Overrides for applications not respecting XDG dirs
export _Z_DATA="$XDG_DATA_HOME/z"
export STACK_ROOT="$XDG_DATA_HOME"/stack
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export POETRY_HOME="$XDG_CACHE_HOME"/poetry
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
