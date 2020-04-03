# Export default programs
export EDITOR="vim"
export BROWSER="qutebrowser"

# Path
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
export PATH="$XDG_DATA_HOME/poetry/bin:$PATH"
export GOPATH=~/workspace/go
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

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
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME"/httpie
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export PLTUSERHOME="$XDG_DATA_HOME"/racket
export RANDFILE="$XDG_CACHE_HOME"/openssl/rnd
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
